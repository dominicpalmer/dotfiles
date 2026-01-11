## 1. Settings
- Taskbar (e.g. no notifications, no search, etc)
- Settings
- Control Panel
- Windows Security (e.g. turn off protected folder access)

## 2. Apps
- Firefox
- Thunderbird
- Notepad++
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
- gsudo
- OhMyPosh (winget install JanDeDobbeleer.OhMyPosh --source winget)
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
- JetBrains Toolbox (update settings to have apps installed to `C:\Program Files\JetBrains`)
- JetBrains Apps via Toolbox (E.g. Rider, PyCharm, IntelliJ, DataGrip, dotX tools)
- Node (nvm from https://github.com/coreybutler/nvm-windows/releases, then `nvm install lts` and `nvm use <version>`)
- Python
- Jekyll
- Postman
- Treesize
- Windirstat
- Steam
- EA
- Ubisoft Connect
- Epic Games Launcher
- Battle.net
- GOG Galaxy

## 3. Root and Dotfiles
- Setup root
- Clone dotfiles from https://github.com/dominicpalmer/dotfiles
- In admin PowerShell create 'dotfiles' path env variable via `setx /m dotfiles <path>`
- Run `./dotfiles.ps1` from script root

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
