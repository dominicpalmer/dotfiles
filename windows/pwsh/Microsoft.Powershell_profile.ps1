Set-ExecutionPolicy -Scope CurrentUser Unrestricted

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme agnoster
$global:DefaultUser = [System.Environment]::UserName

# Aliases
function sudo { gsudo --loadProfile $args }
function dotfiles { Set-Location $env:Dotfiles }
function grep {
    $Arguments = $args
    $ArgumentCount = $Arguments.Length

    if ($ArgumentCount -eq 0) {
        Write-Host "No arguments, nothing to do"
        return
    }

    $Recurse = $Arguments[0] -eq '-r'

    if ($Recurse) {
        $Before = "Get-ChildItem ./ -Recurse |"

        $RecursiveArgs = $Arguments[1..$ArgumentCount]
        $After = "$RecursiveArgs"
    }
    else {
        $Before = ""
        $After = "$Arguments"
    }

    Invoke-Expression "$Before Select-String $After"
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

# Autocompletion
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
Set-PSReadLineKeyHandler -Chord "Shift+LeftArrow" -Function SelectBackwardChar
Set-PSReadLineKeyHandler -Chord "Shift+LeftArrow" -Function SelectBackwardChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "Shift+RightArrow" -Function SelectForwardChar
Set-PSReadLineKeyHandler -Chord "Shift+RightArrow" -Function SelectForwardChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+LeftArrow" -Function SelectBackwardWord
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+LeftArrow" -Function SelectBackwardWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+RightArrow" -Function SelectForwardWord
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+RightArrow" -Function SelectForwardWord -ViMode Command

Set-PSReadLineKeyHandler -Chord "Ctrl+a" -Function SelectAll
Set-PSReadLineKeyHandler -Chord "Ctrl+a" -Function SelectAll -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+c" -Function CopyOrCancelLine
Set-PSReadLineKeyHandler -Chord "Ctrl+c" -Function CopyOrCancelLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "Ctrl+x" -Function Cut
Set-PSReadLineKeyHandler -Chord "Ctrl+x" -Function Cut -ViMode Command

Set-PSReadLineKeyHandler -Key "U" -Function Redo -ViMode Command
Set-PSReadLineKeyHandler -Key "L" -Function EndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Key "H" -Function GotoFirstNonBlankOfLine -ViMode Command
Set-PSReadLineKeyHandler -Key "M" -Function ViJoinLines -ViMode Command

Set-PSReadLineKeyHandler -Key "r" -Function PasteBefore -ViMode Command
Set-PSReadLineKeyHandler -Key "R" -Function PasteAfter -ViMode Command

Set-PSReadLineKeyHandler -Key "d" -Function BackwardDeleteChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "d,H" -Function DeleteLineToFirstChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "d,L" -Function DeleteToEnd -ViMode Command

Set-PSReadLineKeyHandler -Key "t" -Function Yank -ViMode Command
Set-PSReadLineKeyHandler -Key "T" -Function ViYankToEndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,w" -Function ViYankNextWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,W" -Function ViYankNextGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,b" -Function ViYankPreviousWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,B" -Function ViYankPreviousGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,e" -Function ViYankEndOfWord -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,E" -Function ViYankEndOfGlob -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,L" -Function ViYankToEndOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,H" -Function ViYankToFirstChar -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,l" -Function ViYankRight -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,h" -Function ViYankLeft -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,t" -Function ViYankLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,0" -Function ViYankBeginningOfLine -ViMode Command
Set-PSReadLineKeyHandler -Chord "t,Q" -Function ViYankPercent -ViMode Command

Set-PSReadLineKeyHandler -Key "V" -Function CaptureScreen -ViMode Command

# Searching history incrementally from / doesn't always work
# Up/Down straight from the current input does
Set-PSReadLineKeyHandler -Key "j" -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Key "k" -Function HistorySearchBackward -ViMode Command
