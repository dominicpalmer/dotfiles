## 1. System Settings
- Taskbar (e.g. no notifications, no search, etc)
- Settings
- Control Panel
- Windows Security (turn off protected folder access)

## 2. Install Core Apps
- Firefox
- Thunderbird
- Notepad++
- Obsidian
- VSCode
- Git
- LibreOffice
- AutoHotKey
- VeraCrypt
- KeePass2
- ImageGlass
- VLC
- 7Zip
- Powershell 7
- Wezterm
- Everything
- PowerToys
- CopyQ
- Greenshot
- ScreenToGif
- Latest graphics driver
- TranslucentTB
- Spotify
- Okular
- Krita
- TexLive

## 2a. [Optional] Install Dev Apps
- Chocolatey (for refresh env)
- MinGW (`choco install mingw`)
- JetBrains Toolbox (update settings to have apps installed to `C:\Program Files\JetBrains`)
- JetBrains Apps via Toolbox (Rider Community, PyCharm Community, IntelliJ Community, dotX tools)
- Node (nvm from https://github.com/coreybutler/nvm-windows/releases, run `nvm install lts` and `nvm use <version>`)
- Python
- gsudo
- Jekyll

## 2b. [Optional] Install Game Apps
- Steam
- EA
- Ubisoft Connect
- Epic Games Launcher
- Battle.net
- GOG Galaxy

## 3. Transfer Root

## 4. Install Dotfiles
- Clone dotfiles from https://github.com/dominicpalmer/dotfiles; overwrite existing.
- In admin PowerShell create a 'dotfiles' path env variable with `setx /m dotfiles <path>`. Restart if necessary.
- Invoke `./df.ps1 -pwsh_modules --obsidian_vault_path <path>` from the script root with Obsidian path set.

## 5. Program Setup
- Configure startup apps via settings
- Firefox (run through all settings)
- Notepad++ (set as default for .txt, hide most menus, change tab layout, set font and size, and never create backup files)
- Obsidian (setup.txt)
- VSCode (setup.txt)
- Git (copy `common/git/.gitconfig` to `$HOME`, update email, run `ssh-keygen` to create SSH key, then configure via GitHub settings)
- PowerToys (PowerToys run shortcut set to Ctrl+Alt+Space)
- CopyQ (setup.txt)
- Greenshot (don't show magnifier or capture mouse, destination as 'Open in image editor', suppress save dialog on editor close)
- TranslucentTB (set all JSON options to 'clear')
- JetBrains apps (setup.txt)
