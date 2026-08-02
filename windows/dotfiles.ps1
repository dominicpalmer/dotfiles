#--------------------------------------------------------------------------------------------------|
# 1. Install PowerShell modules, create PowerShell symbolic links                                  |
# 2. Create vimrc symbolic links for IdeaVim, VSCodeVim, VSVim. Neovim                             |
# 3. Create WezTerm symbolic links and add binary to PATH                                          |
# 4. Create VSCode symbolic links and install extensions                                           |
# 5. Install fonts                                                                                 |
# 6. Add binary directories to PATH                                                                |
# 7. Create AutoHotKey remap scheduled task to run at logon                                        |
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

    $MaxTitleLength = 80

    if ([string]::IsNullOrEmpty($Text)) {
        return ("-" * $MaxTitleLength)
    }

    if ($Text.Length -ge $MaxTitleLength) {
        return $Text
    }

    # Calculate padding so total length (dashes + spaces + text) equals $MaxTitleLength
    $PaddingLength = $MaxTitleLength - $Text.Length - 2
    $LeftPadding = [math]::Floor($PaddingLength / 2)
    $RightPadding = [math]::Ceiling($PaddingLength / 2)

    return ("-" * $LeftPadding) + " " + $Text + " " + ("-" * $RightPadding)
}

$DotfilesEnv = $env:dotfiles

try {
# Return early if not running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Admin privileges required. Re-run as admin." -ForegroundColor Yellow
    return
}

Write-Host (Add-Dashes -Text "")
$StartSplash = @"
                                    ┓   ┏•┓
                                   ┏┫┏┓╋╋┓┃┏┓┏
                                   ┗┻┗┛┗┛┗┗┗ ┛
"@
Write-Host $StartSplash
Write-Host (Add-Dashes -Text "")

# ------------------------------------------ 1. PowerShell -----------------------------------------
Write-Host (Add-Dashes -Text "1. PowerShell")
$PwshProfilePath = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"
$PwshProfileTarget = "$DotfilesEnv\windows\powershell\Microsoft.Powershell_profile.ps1"
New-Item -ItemType SymbolicLink -Path $PwshProfilePath -Target $PwshProfileTarget -Force | Out-Null
Write-Host "✅ Created symbolic link 'Microsoft.Powershell_profile.ps1'"

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

# ------------------------------------------- 4. VSCode --------------------------------------------
Write-Host (Add-Dashes -Text "4. VSCode")
$VSCodeUserPath = "$HOME\AppData\Roaming\Code\User"
$VSCodeDotfilesPath = "$DotfilesEnv\common\vscode"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\settings.json" -Target "$VSCodeDotfilesPath\settings.jsonc" -Force | Out-Null
Write-Host "✅ Created symbolic link 'settings.json'"
New-Item -ItemType SymbolicLink -Path "$VSCodeUserPath\keybindings.json" -Target "$VSCodeDotfilesPath\keybindings.jsonc" -Force | Out-Null
Write-Host "✅ Created symbolic link 'keybindings.json'"

$ExtensionsFile = "$VSCodeDotfilesPath\extensions.txt"
if (Test-Path $ExtensionsFile) {
    $CodeExe = Get-Command "code" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source
    if (-not $CodeExe) {
        $PossibleCodePaths = @(
            "$HOME\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd",
            "C:\Program Files\Microsoft VS Code\bin\code.cmd"
        )
        foreach ($P in $PossibleCodePaths) {
            if (Test-Path $P) {
                $CodeExe = $P
                break
            }
        }
    }

    if ($CodeExe) {
        $InstalledExtensions = & $CodeExe --list-extensions 2>$null
        $NameToIdMap = @{
            "vim" = "vscodevim.vim"
            "trailing spaces" = "shardulm94.trailing-spaces"
            "error lens" = "usernamehw.errorlens"
            "toggle pin editor" = "marcoantoniomaderalpez.toggle-pin-editor"
            "editorconfig for vscode" = "editorconfig.editorconfig"
            "editorconfig" = "editorconfig.editorconfig"
            "powershell" = "ms-vscode.powershell"
            "latex workshop" = "james-yu.latex-workshop"
            "xml" = "redhat.vscode-xml"
            "yaml" = "redhat.vscode-yaml"
            "vscode-icons" = "vscode-icons-team.vscode-icons"
        }

        foreach ($Line in Get-Content -Path $ExtensionsFile) {
            $LineClean = $Line.Trim()
            if ([string]::IsNullOrWhiteSpace($LineClean) -or $LineClean.StartsWith("#")) { continue }

            $ExtensionId = $LineClean
            $LowerLine = $LineClean.ToLower()
            if ($NameToIdMap.ContainsKey($LowerLine)) {
                $ExtensionId = $NameToIdMap[$LowerLine]
            }

            if ($InstalledExtensions -contains $ExtensionId) {
                Write-Host "✅ VSCode extension '$ExtensionId' already installed"
            } else {
                & $CodeExe --install-extension $ExtensionId --force | Out-Null
                Write-Host "✅ Installed VSCode extension '$ExtensionId'"
            }
        }
    } else {
        Write-Host "⚠️ 'code' CLI not found. Skipped installing VSCode extensions."
    }
}

# -------------------------------------------- 5. Fonts --------------------------------------------
Write-Host (Add-Dashes -Text "5. Fonts")
$FontsDirectory = "$DotfilesEnv\common\fonts"
if (Test-Path $FontsDirectory) {
    Add-Type -AssemblyName PresentationCore
    if (-not ([System.Management.Automation.PSTypeName]'Win32.GDI32').Type) {
        Add-Type -MemberDefinition @"
            [DllImport("gdi32.dll", EntryPoint = "AddFontResourceW", SetLastError = true)]
            public static extern int AddFontResource([In, MarshalAs(UnmanagedType.LPWStr)] string lpFileName);
"@ -Name "GDI32" -Namespace "Win32" | Out-Null
    }

    $DestinationFontsDir = "$env:windir\Fonts"
    $FontRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

    $FontFiles = Get-ChildItem -Path $FontsDirectory -Recurse -File | Where-Object { $_.Extension -match '^\.(ttf|otf|ttc|fon)$' }

    foreach ($FontFile in $FontFiles) {
        $TargetPath = Join-Path $DestinationFontsDir $FontFile.Name

        try {
            $Uri = [System.Uri]::new($FontFile.FullName)
            $GlyphTypeface = [System.Windows.Media.GlyphTypeface]::new($Uri)

            $Family = $GlyphTypeface.Win32FamilyNames[[System.Globalization.CultureInfo]::GetCultureInfo("en-us")]
            if (-not $Family) { $Family = ($GlyphTypeface.Win32FamilyNames.Values | Select-Object -First 1) }

            $Face = $GlyphTypeface.Win32FaceNames[[System.Globalization.CultureInfo]::GetCultureInfo("en-us")]
            if (-not $Face) { $Face = ($GlyphTypeface.Win32FaceNames.Values | Select-Object -First 1) }

            $FontName = "$Family $Face".Trim()
        } catch {
            $FontName = $FontFile.BaseName
        }

        $Extension = $FontFile.Extension.ToLower()
        $FontType = if ($Extension -eq ".otf") { "(OpenType)" } else { "(TrueType)" }
        $RegistryName = "$FontName $FontType"

        $FileCopied = $true
        try {
            Copy-Item -Path $FontFile.FullName -Destination $TargetPath -Force -ErrorAction Stop
        } catch {
            if (Test-Path $TargetPath) {
                $FileCopied = $false
            } else {
                Write-Host "⚠️ Could not copy font '$($FontFile.Name)': $_"
                continue
            }
        }

        try {
            Set-ItemProperty -Path $FontRegistryPath -Name $RegistryName -Value $FontFile.Name -Force -ErrorAction SilentlyContinue
            [Win32.GDI32]::AddFontResource($TargetPath) | Out-Null
        } catch {}

        if ($FileCopied) {
            Write-Host "✅ Installed font '$RegistryName'"
        } else {
            Write-Host "✅ Font '$RegistryName' already installed"
        }
    }
}

# -------------------------------- 6. Add Binary Directories to PATH -------------------------------
Write-Host (Add-Dashes -Text "6. Add Binary Directories to PATH")
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

# ----------------------------------------- 7. AutoHotKey ------------------------------------------
Write-Host (Add-Dashes -Text "7. AutoHotKey")
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
Write-Host (Add-Dashes -Text "")

} catch {
    Write-Output "Failed to update dotfiles:"
    Write-Output $_.Exception.Message
    Write-Output $_.ScriptStackTrace
}
