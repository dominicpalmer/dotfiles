## 1. Debloat via SophiaScript
- https://github.com/farag2/Sophia-Script-for-Windows
- Verify Nvidia Control Panel and Ubuntu LTS are installed. If the deloabt removed them, re-install from Microsoft Store.

## 2. Audit Builtin Settings
- UI (including taskbar links hack)
- Settings GUI (including show File Explorer borders via 'Themes/Colours' then 'Title bars and window borders')
- Control panel
- Turn off protective folder access

## 3. Install Programs
- Install to `C:\Program Files\` where possible
### Web
- Mozilla Firefox
- Mozilla Thunderbird
- Vivaldi
### Utility
- VLC
- 7Zip
- CopyQ (custom install with 'Pinned Items' plugin, launch on startup)
- Greenshot (launch on startup)
- ScreenToGif
- Everything
- ImageGlass
- TranslucentTB
- AutoHotKey
- PowerToys (PowerToys run shortcut set to Ctrl+Alt+Space)
- SysInternals
- KeePass2
- VeraCrypt
- LibreOffice
- Nvidia Graphics Driver
- Okular
- Krita
- Obsidian
- Chocolatey (https://chocolatey.org/install)
- MinGW (choco install mingw)
### Dev
- Powershell 7
- Wezterm
- gsudo
- Git
- Notepad++
- Docker
- JetBrains Toolbox (update settings to have apps installed to `C:\Program Files\JetBrains`)
- JetBrains Apps via Toolbox (Rider EAP, PyCharm Community, dotX tools, IntelliJ)
- Visual Studio
- Visual Studio Code
- Python
- Node (nvm from https://github.com/coreybutler/nvm-windows/releases, run 'nvm install lts' and 'nvm use <version>')
- Jekyll
- MiKTeX
- TeXstudio
### Other
- Spotify
- Steam
- Ubisoft Connect
- EA App

## 4. Set Startup Apps via Settings

## 5. Dotfiles
- Clone dotfiles from https://github.com/dominicpalmer/dotfiles
- In admin PowerShell create a 'dotfiles' path env variable with `setx /m dotfiles <path>`. Restart if necessary.
- Invoke `./df.ps1 -pwsh_modules` from the script root. Can also specify Obsidian path with `--obsidian_vault_path <path>`.

## 6. Program Setup
- Vivaldi (setup.txt)
- Obsidian (setup.txt)
- CopyQ (setup.txt)
- JetBrains apps (setup.txt)
- Visual Studio (setup.txt)
- Visual Studio Code (setup.txt)
- Notepad++ (set as default for .txt, hide most menus, then change tab layout, font, font size, and never create backup files)
- Git (copy `common/git/.gitconfig` to `$HOME`, update email, run `ssh-keygen` to create SSH key, then configure via GitHub settings)
- TranslucentTB (set all JSON options to 'clear')
- Greenshot (don't show magnifier or capture mouse, destination as 'Open in image editor', suppress save dialog on editor close)
- Firefox
