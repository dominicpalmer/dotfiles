#requires -Version 2 -Modules posh-git

function Write-Theme {

    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    $lastColor = $sl.Colors.PromptBackgroundColor
    $darkBlue = '#292e57'

    #check the last command state and indicate if failed
    If ($lastCommandFailed) {
        $prompt += Write-Prompt -Object "🔥" -ForegroundColor $sl.Colors.CommandFailedIconForegroundColor -BackgroundColor $darkBlue
    }
    else {
        $prompt = Write-Prompt -Object $sl.PromptSymbols.StartSymbol -ForegroundColor $sl.Colors.SessionInfoForegroundColor -BackgroundColor $darkBlue
    }

    #check for elevated prompt
    If (Test-Administrator) {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.ElevatedSymbol)" -ForegroundColor $sl.Colors.AdminIconForegroundColor -BackgroundColor $darkBlue
    }

    $user = $sl.CurrentUser
    $computer = [System.Environment]::MachineName
    if (Test-NotDefaultUser($user)) {
        $prompt += Write-Prompt -Object "$user@$computer " -ForegroundColor $sl.Colors.SessionInfoForegroundColor -BackgroundColor $darkBlue
    }

    if (Test-VirtualEnv) {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $darkBlue -BackgroundColor $sl.Colors.VirtualEnvBackgroundColor
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.VirtualEnvSymbol) $(Get-VirtualEnvName) " -ForegroundColor $sl.Colors.VirtualEnvForegroundColor -BackgroundColor $sl.Colors.VirtualEnvBackgroundColor
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.VirtualEnvBackgroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    }
    else {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $darkBlue -BackgroundColor $sl.Colors.PromptBackgroundColor
    }

    # Writes the drive portion
    $path = (Get-FullPath -dir $pwd) + ' '
    $prompt += Write-Prompt -Object $path -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor

    $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $lastColor = $themeInfo.BackgroundColor
        $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $lastColor
        $prompt += Write-Prompt -Object "$($themeInfo.VcInfo)".Replace('', '').Replace('≣ ', '').Replace(' !', ' ') -BackgroundColor $lastColor -ForegroundColor '#000000'
    }

    if ($with) {
        $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $lastColor -BackgroundColor $sl.Colors.WithBackgroundColor
        $prompt += Write-Prompt -Object " $($with.ToUpper()) " -BackgroundColor $sl.Colors.WithBackgroundColor -ForegroundColor $sl.Colors.WithForegroundColor
        $lastColor = $sl.Colors.WithBackgroundColor
    }

    # Writes the postfix to the prompt
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $lastColor
    $prompt += ' '
    $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.PromptSymbols.SegmentForwardSymbol = [char]::ConvertFromUtf32(0xE0B0)
$sl.Colors.SessionInfoBackgroundColor = [ConsoleColor]::DarkGray
$sl.Colors.PromptForegroundColor = [ConsoleColor]::White
$sl.Colors.PromptSymbolColor = [ConsoleColor]::White
$sl.Colors.PromptHighlightColor = [ConsoleColor]::DarkBlue
$sl.Colors.GitForegroundColor = [ConsoleColor]::DarkGray
$sl.Colors.WithForegroundColor = [ConsoleColor]::White
$sl.Colors.WithBackgroundColor = [ConsoleColor]::DarkRed
$sl.Colors.VirtualEnvBackgroundColor = [System.ConsoleColor]::Red
$sl.Colors.VirtualEnvForegroundColor = [System.ConsoleColor]::White
