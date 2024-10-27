#------------------------------------------------------------------------------|
#                                                                              |
# 0. [Optional] Installs PowerShell modules if supplied pwsh_modules switch    |
# 1. Creates PowerShell profile symbolic link                                  |
# 2. Creates vimrc symbolic links for IdeaVim, VSCodeVim, VSVim                |
# 3. Creates WezTerm symbolic links and adds binary to PATH                    |
# 4. Creates VSCode settings symbolic links                                    |
# 5. Adds shortcut and dotfiles install directories to PATH                    |
# 6. Creates an AutoHotKey remap scheduled task to run at logon                |
# 7. [Optional] Creates obsidian.css symbolic link for todo vault              |
#                                                                              |
#------------------------------------------------------------------------------|

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [Switch] $pwsh_modules,

    [Parameter(Mandatory = $false)]
    [String] $obsidian_vault_path
)

function Add-To-Path {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $PathToAdd
    )

    $PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
    $Path = (Get-ItemProperty -Path $PathRegistry -Name path).path

    if (!($Path -split ";" -contains $PathToAdd)) {
        $Path = "$Path;$PathToAdd"
    }

    Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}

try {

# -------------------------- 0. Install PowerShell modules if requested

if ($pwsh_modules) {
    Install-Module posh-git -Force

    # Install PSReadLine 2.1.0, for line completion via <Esc>l. Note that before
    # version 2.1.0 is used by PowerShell, the version that shipped with
    # PowerShell 7 must be deleted when no PowerShell instances are open.
    # Delete old versions at $HOME\Documents\PowerShell\Modules\PSReadLine.
    #Install-Module -Name PSReadLine -RequiredVersion 2.1.0 -AllowPreRelease -Force

    $PowerShellModulesPath = "C:\Program Files\Powershell\7\Modules"

    # Remove any existing version of oh-my-posh
    $OhMyPoshPath = "$PowerShellModulesPath\oh-my-posh"
    if (Get-Item -Path $OhMyPoshPath -ErrorAction Ignore) {
        Remove-Item $OhMyPoshPath -Recurse -Force
    }

    # Clone oh-my-posh V2 source into the Modules directory, which makes it usable
    git clone https://github.com/JanDeDobbeleer/oh-my-posh2 "$PowerShellModulesPath\oh-my-posh"
}

$DotfilesEnv = $env:dotfiles

# -------------------------- 1. PowerShell profile and theme
$PwshProfilePath = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"
$PwshProfileTarget = "$DotfilesEnv\windows\powershell\Microsoft.Powershell_profile.ps1"
New-Item -ItemType SymbolicLink -Path $PwshProfilePath -Target $PwshProfileTarget -Force
$PwshThemePath = "C:\Program Files\PowerShell\7\Modules\oh-my-posh\Themes\doms-theme.psm1"
$PwshThemeTarget = "$DotfilesEnv\windows\powershell\doms-theme.psm1"
New-Item -ItemType SymbolicLink -Path $PwshThemePath -Target $PwshThemeTarget -Force

# -------------------------- 2. vimrc symbolic links
New-Item -ItemType SymbolicLink -Path "$HOME\.ideavimrc" -Target "$DotfilesEnv\common\jetbrains\.ideavimrc" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.vsvimrc" -Target "$DotfilesEnv\windows\vs\.vsvimrc" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.vscodevimrc" -Target "$DotfilesEnv\common\vscode\.vscodevimrc" -Force

# -------------------------- 3. WezTerm symbolic links and binary
$WezTermPathsToLink = @(
    "C:\Program Files\WezTerm\wezterm.lua",
    "C:\Program Files\WezTerm\lua"
)

foreach ($WezTermPath in $WezTermPathsToLink) {
    $Target = "$DotfilesEnv\common\wezterm\" + $WezTermPath.Split('\')[-1]
    New-Item -ItemType SymbolicLink -Path $WezTermPath -Target $Target -Force
}

Add-To-Path "C:\Program Files\WezTerm"

# -------------------------- 4. VSCode settings symbolic links
$VSCodeUserPath = "$HOME\AppData\Roaming\Code\User"
$VSCodeDotfilesPath = "$DotfilesEnv\common\vscode"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\settings.json" -Target "$VSCodeDotfilesPath\settings.jsonc" -Force
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\keybindings.json" -Target "$VSCodeDotfilesPath\keybindings.jsonc" -Force

# -------------------------- 5. Add install and shortcut directories to PATH
$InstallDirectory = "$DotfilesEnv\windows"
Add-To-Path $InstallDirectory

$ShortcutsDirectory = "$DotfilesEnv\windows\shortcuts"
Add-To-Path $ShortcutsDirectory

$Exclusions = @("template")
foreach ($Directory in Get-ChildItem -Directory $ShortcutsDirectory -Exclude $Exclusions) {
    Add-To-Path $Directory
}

# -------------------------- 6. AHK scheduled task for keyboard remaps
$TaskName = "remaps"

# Delete any existing task of the same name
if (Get-ScheduledTask | Where-Object { $_.TaskName -like $TaskName }) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

# Create the new task to run at logon
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action = New-ScheduledTaskAction -Execute "$DotfilesEnv\windows\autohotkey\remaps.ahk"
Register-ScheduledTask -Trigger $Trigger -Action $Action -TaskPath "AutoHotkey" -TaskName $TaskName -RunLevel Highest
Start-ScheduledTask -TaskName "AutoHotkey\$TaskName"

# -------------------------- 7. obsidian.css symbolic link for main vault
if (![String]::IsNullOrEmpty($obsidian_vault_path)) {
    New-Item -ItemType SymbolicLink -Path "$obsidian_vault_path\.obsidian\snippets\obsidian.css" -Target "$DotfilesEnv\common\obsidian\obsidian.css" -Force
}

} catch {
    Write-Output "Failed to update dotfiles:"
    Write-Output $_.Exception.Message
    Write-Output $_.ScriptStackTrace
}