#--------------------------------------------------------------------------------------------------|
# 1. Install PowerShell modules, create PowerShell symbolic links                                  |
# 2. Create vimrc symbolic links for IdeaVim, VSCodeVim, VSVim. Neovim                             |
# 3. Create WezTerm symbolic links and add binary to PATH                                          |
# 4. Create VSCode settings and keybindings symbolic links                                         |
# 5. Add binary directories to PATH                                                                |
# 6. Create AutoHotKey remap scheduled task to run at logon                                        |
#--------------------------------------------------------------------------------------------------|

function Add-To-Path {
    param (
        [string] $PathToAdd
    )

    $PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
    $Path = (Get-ItemProperty -Path $PathRegistry -Name path).path

    if (!($Path -split ";" -contains $PathToAdd)) {
        $Path = "$Path;$PathToAdd"
    }

    Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}

function Add-Dashes {
    param (
        [string]$Text
    )

    # Calculate padding needed
    $MaxTitleLength = 80
    $PaddingLength = $MaxTitleLength - $Text.Length
    $LeftPadding = [math]::Floor($PaddingLength / 2)
    $RightPadding = [math]::Ceiling($PaddingLength / 2)

    return ("-" * $LeftPadding) + " $Text " + ("-" * $RightPadding)
}

$DotfilesEnv = $env:dotfiles

try {
    $StartSplash = @"

                                    ┓   ┏•┓
                                   ┏┫┏┓╋╋┓┃┏┓┏
                                   ┗┻┗┛┗┛┗┗┗ ┛

"@
Write-Host $StartSplash

# ------------------------------------------ 1. PowerShell -----------------------------------------
Write-Host (Add-Dashes -Text "1. PowerShell")

winget install JanDeDobbeleer.OhMyPosh --source winget
Write-Host "✅ Installed OhMyPosh via winget"

$PowerShell7BasePath = "C:\Program Files\Powershell\7"

# Symbolic link profile
$PwshProfilePath = "$PowerShell7BasePath\Microsoft.Powershell_profile.ps1"
$PwshProfileTarget = "$DotfilesEnv\windows\powershell\Microsoft.Powershell_profile.ps1"
New-Item -ItemType SymbolicLink -Path $PwshProfilePath -Target $PwshProfileTarget -Force | Out-Null
Write-Host "✅ Created symbolic link 'Microsoft.Powershell_profile.ps1'"

# Symbolic link theme
$PwshThemePath = "C:\Program Files\PowerShell\7\Modules\oh-my-posh\Themes\doms-theme.psm1"
$PwshThemeTarget = "$DotfilesEnv\windows\powershell\doms-theme.psm1"
New-Item -ItemType SymbolicLink -Path $PwshThemePath -Target $PwshThemeTarget -Force | Out-Null
Write-Host "✅ Created symbolic link 'doms-theme.psm1'"
Write-Host "`r"

# -------------------------------------------- 2. vimrc --------------------------------------------
Write-Host (Add-Dashes -Text "2. vimrc")
New-Item -ItemType SymbolicLink -Path "$HOME\.ideavimrc" -Target "$DotfilesEnv\common\jetbrains\.ideavimrc" -Force | Out-Null
Write-Host "✅ Created symbolic link '.ideavimrc'"
New-Item -ItemType SymbolicLink -Path "$HOME\.vscodevimrc" -Target "$DotfilesEnv\common\vscode\.vscodevimrc" -Force | Out-Null
Write-Host "✅ Created symbolic link '.vscodevimrc'"
New-Item -ItemType SymbolicLink -Path "$HOME\.vimrc" -Target "$DotfilesEnv\common\vim\.vimrc" -Force | Out-Null
Write-Host "✅ Created symbolic link '.vimrc'"
New-Item -ItemType SymbolicLink -Path "$HOME\APPDATA\Local\nvim" -Target "$DotfilesEnv\common\nvim" -Force | Out-Null
Write-Host "✅ Created symbolic link '\nvim'"
Write-Host "`r"

# ------------------------------------------- 3. WezTerm -------------------------------------------
Write-Host (Add-Dashes -Text "3. WezTerm")
$WezTermPathsToLink = @(
    "C:\Program Files\WezTerm\wezterm.lua",
    "C:\Program Files\WezTerm\lua"
)

foreach ($WezTermPath in $WezTermPathsToLink) {
    $TargetName = $WezTermPath.Split('\')[-1]
    $TargetPath = "$DotfilesEnv\common\wezterm\" + $TargetName
    New-Item -ItemType SymbolicLink -Path $WezTermPath -Target $TargetPath -Force | Out-Null
    Write-Host "✅ Created symbolic link '$TargetName'"
}

$WezTermProgramPath = "C:\Program Files\WezTerm"
Add-To-Path $WezTermProgramPath
Write-Host "✅ Added '$WezTermProgramPath' to PATH"
Write-Host "`r"

# ------------------------------------------- 4. VSCode --------------------------------------------
Write-Host (Add-Dashes -Text "4. VSCode")
$VSCodeUserPath = "$HOME\AppData\Roaming\Code\User"
$VSCodeDotfilesPath = "$DotfilesEnv\common\vscode"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\settings.json" -Target "$VSCodeDotfilesPath\settings.jsonc" -Force | Out-Null
Write-Host "✅ Created symbolic link 'settings.json"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\keybindings.json" -Target "$VSCodeDotfilesPath\keybindings.jsonc" -Force | Out-Null
Write-Host "✅ Created symbolic link 'keybindings.json'"
Write-Host "`r"

# -------------------------------- 5. Add Binary Directories to PATH -------------------------------
Write-Host (Add-Dashes -Text "5. Add Binary Directories to PATH")
$InstallDirectory = "$DotfilesEnv\windows"
Add-To-Path $InstallDirectory | Out-Null
Write-Host "✅ Added '$InstallDirectory' to PATH"

$ScriptsDirectory = "$DotfilesEnv\windows\scripts"
Add-To-Path $ScriptsDirectory | Out-Null
Write-Host "✅ Added '$ScriptsDirectory' to PATH"

$Exclusions = @("template")
foreach ($Directory in Get-ChildItem -Directory $ScriptsDirectory -Exclude $Exclusions) {
    Add-To-Path $Directory | Out-Null
    Write-Host "✅ Added '$Directory' to PATH"
}
Write-Host "`r"

# ----------------------------------------- 6. AutoHotKey ------------------------------------------
Write-Host (Add-Dashes -Text "6. AutoHotKey")
$TaskName = "remaps"

# Delete any existing task of the same name
if (Get-ScheduledTask | Where-Object { $_.TaskName -like $TaskName }) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
    Write-Host "✅ Removed existing AutoHotKey scheduled task 'remaps.ahk'"
}

# Create the new task to run at logon
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action = New-ScheduledTaskAction -Execute "$DotfilesEnv\windows\autohotkey\remaps.ahk"
Register-ScheduledTask -Trigger $Trigger -Action $Action -TaskPath "AutoHotkey" -TaskName $TaskName -RunLevel Highest | Out-Null
Write-Host "✅ Created new AutoHotKey scheduled task 'remaps.ahk'"
Start-ScheduledTask -TaskName "AutoHotkey\$TaskName"
Write-Host "✅ Started AutoHotKey scheduled task 'remaps.ahk'"
Write-Host "`r"

} catch {
    Write-Output "Failed to update dotfiles:"
    Write-Output $_.Exception.Message
    Write-Output $_.ScriptStackTrace
}
