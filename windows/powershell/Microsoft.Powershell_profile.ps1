Set-ExecutionPolicy -Scope CurrentUser Unrestricted

Import-Module posh-git
Import-Module oh-my-posh
# Inspiration from https://ohmyposh.dev/docs/themes
Set-Theme doms-theme
$global:DefaultUser = [System.Environment]::UserName

# Aliases
function sudo { gsudo --loadProfile $args }
function dotfiles { Set-Location $env:dotfiles }
function vim { nvim $args }
function grep {
    $Arguments = $args
    $ArgumentCount = $Arguments.Length

    if ($ArgumentCount -eq 0) {
        Write-Host "ERROR: no arguments"
        Write-Host "Search current directory: grep keyword"
        Write-Host "Search current and nested directories: grep -r keyword"
        return
    }

    $ShouldRecurse = $Arguments[0] -eq '-r'

    if ($ShouldRecurse) {
        $Command = "Get-ChildItem ./ -Recurse | Select-String "

        $RecursiveArgs = $Arguments[1..$ArgumentCount]
        $CommandArgs = "$RecursiveArgs"
    }
    else {
        if ($ArgumentCount -gt 1) {
            Write-Host "ERROR: keyword includes a space"
            return
        }

        $Command = "Get-ChildItem ./ | Select-String "
        $CommandArgs = "$Arguments"
    }

    $Expression = "$Command $CommandArgs"
    Write-Host $Expression

    Invoke-Expression $Expression
}

# Use insert mode line cursor on startup, and switch cursors on mode change
$LineCursor = "`e[6 q"
$BlockCursor = "`e[2 q"
Write-Host -NoNewLine $LineCursor

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Block cursor
        Write-Host -NoNewLine $BlockCursor
    }
    else {
        # Line cursor
        Write-Host -NoNewLine $LineCursor
    }
}

# Options
Set-PSReadlineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = '#948e8c' }

# Complete lines with 'l' from normal mode
Set-PSReadLineKeyHandler -Key "l" -ViMode Command -ScriptBlock {
    param($key, $arg)

    $Line = $null
    $Cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$Line, [ref]$Cursor)

    if ($Cursor -lt $Line.Length - 1) {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    }
    else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
    }
}

# Keybindings
# https://learn.microsoft.com/en-us/dotnet/api/microsoft.powershell.psconsolereadline?view=powershellsdk-1.1.0
Set-PSReadLineKeyHandler -Chord "Shift+LeftArrow" -Function SelectBackwardChar
Set-PSReadLineKeyHandler -Chord "Shift+LeftArrow" -Function SelectBackwardChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "Shift+RightArrow" -Function SelectForwardChar
Set-PSReadLineKeyHandler -Chord "Shift+RightArrow" -Function SelectForwardChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+Shift+LeftArrow" -Function SelectBackwardWord
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+LeftArrow" -Function SelectBackwardWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+RightArrow" -Function SelectForwardWord
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+RightArrow" -Function SelectForwardWord -ViMode Command

Set-PSReadLineKeyHandler -Key "f" -Function ViBackwardWord -ViMode Command
Set-PSReadLineKeyHandler -Key "F" -Function ViBackwardGlob -ViMode Command
Set-PSReadLineKeyHandler -Key "H" -Function GotoFirstNonBlankOfLine -ViMode Command
Set-PSReadLineKeyHandler -Key "L" -Function EndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Key "M" -Function ViJoinLines -ViMode Command
Set-PSReadLineKeyHandler -Key "U" -Function Redo -ViMode Command

# Unfortunately there's no 'ReplaceChar' function
# Set-PSReadLineKeyHandler -Key "m" -Function ViReplaceChar -ViMode Command

Set-PSReadLineKeyHandler -Key "s" -Function DeleteChar -ViMode Command
Set-PSReadLineKeyHandler -Key "Backspace" -Function DeleteChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "d,H" -Function DeleteLineToFirstChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "d,L" -Function DeleteToEnd -ViMode Command

Set-PSReadLineKeyHandler -Key "r" -Function PasteBefore -ViMode Command
Set-PSReadLineKeyHandler -Key "R" -Function PasteAfter -ViMode Command

Set-PSReadLineKeyHandler -Key "t" -Function Yank -ViMode Command
Set-PSReadLineKeyHandler -Key "T" -Function ViYankToEndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,w" -Function ViYankNextWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,W" -Function ViYankNextGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,b" -Function ViYankPreviousWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,B" -Function ViYankPreviousGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,e" -Function ViYankEndOfWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,E" -Function ViYankEndOfGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,l" -Function ViYankRight -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,L" -Function ViYankToEndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,h" -Function ViYankLeft -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,H" -Function ViYankToFirstChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,t" -Function ViYankLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,0" -Function ViYankBeginningOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,Q" -Function ViYankPercent -ViMode Command

Set-PSReadLineKeyHandler -Chord "Ctrl+a" -Function SelectAll
Set-PSReadLineKeyHandler -Chord "Ctrl+a" -Function SelectAll -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+c" -Function CopyOrCancelLine
Set-PSReadLineKeyHandler -Chord "Ctrl+c" -Function CopyOrCancelLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+x" -Function Cut
Set-PSReadLineKeyHandler -Chord "Ctrl+x" -Function Cut -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function BackwardDeleteWord

# Search up/down based on the current input
Set-PSReadLineKeyHandler -Key "j" -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Key "k" -Function HistorySearchBackward -ViMode Command
