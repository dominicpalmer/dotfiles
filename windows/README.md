## 1. System Settings
- Taskbar (e.g. no notifications, no search, etc)
- Settings
- Control Panel
- Windows Security (e.g. turn off protected folder access)

## 2. Install Apps
- [Core] Firefox
- [Core] Thunderbird
- [Core] Notepad++
- [Core] VSCode
- [Core] Git
- [Core] LibreOffice
- [Core] AutoHotKey
- [Core] VeraCrypt
- [Core] KeePass2
- [Core] ImageGlass
- [Core] VLC
- [Core] 7Zip
- [Core] Powershell 7
- [Core] Wezterm
- [Core] Everything
- [Core] gsudo
- [Core] PowerToys
- [Core] CopyQ
- [Core] Greenshot
- [Core] ScreenToGif
- [Core] Latest graphics driver
- [Core] TranslucentTB
- [Core] Spotify
- [Core] Okular
- [Core] Krita
- [Core] TexLive
- [Games] Steam
- [Games] EA
- [Games] Ubisoft Connect
- [Games] Epic Games Launcher
- [Games] Battle.net
- [Games] GOG Galaxy
- [Dev] JetBrains Toolbox (update settings to have apps installed to `C:\Program Files\JetBrains`)
- [Dev] JetBrains Apps via Toolbox (E.g. Rider, PyCharm, IntelliJ, DataGrip, dotX tools)
- [Dev] Node (nvm from https://github.com/coreybutler/nvm-windows/releases, then `nvm install lts` and `nvm use <version>`)
- [Dev] Python
- [Dev] Jekyll
- [Dev] Postman
- [Dev] Treesize
- [Dev] Windirstat

## 3. Root and Dotfiles
- Setup root
- Clone dotfiles from https://github.com/dominicpalmer/dotfiles
- In admin PowerShell create 'dotfiles' path env variable via `setx /m dotfiles <path>`
- Run `./df.ps1 -pwsh_modules` from script root

## 4. Final Config
- Configure startup apps via settings
- JetBrains apps (setup.txt)
- VSCode (setup.txt)
- CopyQ (setup.txt)
- Firefox (run through all settings)
- Notepad++ (set as default for .txt, hide most menus, change tab layout, set font and size, never create backup files)
- Git (copy `common/git/.gitconfig` to `$HOME`, update email, run `ssh-keygen` to create SSH key, then configure via GitHub settings)
- Greenshot (don't show magnifier or capture mouse, destination as 'Open in image editor', suppress save dialog on editor close)
- TranslucentTB (set all JSON options to 'clear')
