################################################################################
#                                                                              #
# 0. Installs PowerShell modules if invoked with pwsh-modules                  #
# 1. Creates PowerShell profile symbolic link                                  #
# 2. Creates vimrc symbolic links for IdeaVim, VSCodeVim, VSVim                #
# 3. Creates WezTerm symbolic links and adds binary to PATH                    #
# 4. Creates VSCode symbolic links                                             #
# 5. Adds shortcut and dotfiles install directories to PATH                    #
# 6. Disables Win+l screen locking, to allow an AHK remap                      #
# 7. Creates an AHK remap scheduled task to run at logon                       #
#                                                                              #
################################################################################

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [Switch] $pwsh_modules
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

############################### 0. Install PowerShell modules if requested

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

    # Clone oh-my-posh V2 source into the Modules directory, making it usable
    git clone https://github.com/JanDeDobbeleer/oh-my-posh2 "$PowerShellModulesPath\oh-my-posh"
}

############################### 1. PowerShell profile symbolic link

$PwshProfilePath = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"
$PwshProfileTarget = "$env:Dotfiles\windows\pwsh\Microsoft.Powershell_profile.ps1"
New-Item -ItemType SymbolicLink -Path $PwshProfilePath -Target $PwshProfileTarget -Force

############################### 2. vimrc symbolic links

New-Item -ItemType SymbolicLink -Path "$HOME\.ideavimrc" -Target "$env:Dotfiles\common\jetbrains\.ideavimrc" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.vscodevimrc" -Target "$env:Dotfiles\common\vscode\.vscodevimrc" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.vsvimrc" -Target "$env:Dotfiles\windows\vs\.vsvimrc" -Force

############################### 3. WezTerm symbolic links and binary

$WezTermPathsToLink = @(
    "C:\Program Files\WezTerm\wezterm.lua",
    "C:\Program Files\WezTerm\lua"
)

foreach ($WezTermPath in $WezTermPathsToLink) {
    $Target = "$env:Dotfiles\common\wezterm\" + $WezTermPath.Split('\')[-1]
    New-Item -ItemType SymbolicLink -Path $WezTermPath -Target $Target -Force
}

Add-To-Path "C:\Program Files\WezTerm"

############################### 4. VSCode symbolic links
$VSCodeUserPath = "$HOME\AppData\Roaming\Code\User"
$VSCodeDotfilesPath = "$env:Dotfiles\common\vscode"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\settings.json" -Target "$VSCodeDotfilesPath\settings.jsonc" -Force
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\keybindings.json" -Target "$VSCodeDotfilesPath\keybindings.jsonc" -Force

############################### 5. Add shortcut and install directory to PATH

$PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
$Path = (Get-ItemProperty -Path $PathRegistry -Name path).path

$DirectoriesToAdd = Get-ChildItem "$env:Dotfiles\windows\bin" -Exclude "template"
$DirectoriesToAdd = $DirectoriesToAdd + "$env:Dotfiles\windows"

foreach ($Directory in $DirectoriesToAdd) {
    Add-To-Path $Directory
}

############################### 6. Disables Win+l screen locking

$RegistryPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$Name = 'DisableLockWorkstation'
$Value = '00000001'

# Creates the registry path if it does not exist
If (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Sets the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force

############################### 7. AHK scheduled task for keyboard remaps

$TaskName = "remaps"

# Delete any existing task of the same name
if (Get-ScheduledTask | Where-Object { $_.TaskName -like $TaskName }) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

# Create the new task to run at logon
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action = New-ScheduledTaskAction -Execute "$env:Dotfiles\windows\keyboard\remaps.ahk"
Register-ScheduledTask -Trigger $Trigger -Action $Action -TaskPath "AutoHotkey" -TaskName $TaskName -RunLevel Highest
Start-ScheduledTask -TaskName "AutoHotkey\$TaskName"
