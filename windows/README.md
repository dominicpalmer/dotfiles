# Windows config

## Summary

This readme contains an overview of common configuration and software I add to fresh Windows installs. Much is ommitted - this readme is dedicated to useful day one changes only.

Contents:

1. [OS](#os)
2. [Windows Terminal](#terminal)
3. [WSL2](#wsl)
4. [MinGW](#mingw)
5. [C/C++](#ccpp)
6. [Python](#python)
7. [Anaconda](#anaconda)
8. [Node](#node)
9. [Git](#git)
10. [Notepad++](#npp)

## <a id="os"></a> <img src="../img/microsoft.png" alt="microsoft" width="25"/> <span style="font-size:larger;"> OS </span>

### Core settings

When faced with a fresh Windows install:

1. Do a full sweep of every single control panel setting to configure UI, security, privacy, security etc.
2. Clean up the taskbar. Remove Cortana, search, the notifications button, and use small icons
3. Clean up the start menu by removing all tiles and resizing
4. Pin commonly used folders to Quick Access in File Explorer, such as **C:\\**, **C:\Program Files**, **C:\Program Files (x86)**
5. Edit File Explorer settings to always show file extensions and always show hidden files and folders
6. Add USERPROFILE and HOME local user environment variables with the value **C:\Users\\\<username>**, if they don't already exist
7. Create a **C:\bin** folder add to it the aliasing CMD scripts found in this repo, used to open frequently used programs. Add the folder to `PATH`
8. Force Outlook to instantly mark emails as read upon clicking by heading to Reading Pane settings and changing time to mark read as 0
9. Install Rainmeter, then install and use the TaskbarX skin

### Software

Install and configure useful software and add startup scripts to **C:\bin** where neccessary:

- 7Zip
- Windows Terminal
- sysinternals (place in **C:\bin** and add to `PATH`)
- WireShark
- Firefox (import useful bookmarks and configure addons/UI)
- Python
- Chocolatey
- Node
- AutoHotKey (set **qwerty-extend.ahk** to run at startup with admin rights via Task Scheduler)
- Postman
- Sourcetree
- Visual Studio (per instructions in **./visual-studio/README.md**)
- VSCode

Refresh on common Windows tooling aliases for quick startup via *Win+R*:

- IIS: `inetmgr`
- Services: `services.msc`
- Event Viewer: `eventvwr`
- Registry Editor: `regedit`
- Local machine certificate manager: `certlm.msc`
- Local user certificate manager: `certmgr.msc`
- List active processess: `pslist`
- Kill a process: `pskill <pid>`
- Process explorer: `procexp`
- Process monitor: `procmon`
- TCP View: `tcpview`
- VSCode: `code`
- Firefox: `firefox` (or `ff` via the alias cmd script)

## <a id="terminal"></a> <img src="../img/terminal.png" alt="terminal" width="23"/> <span style="font-size:larger;"> Windows Terminal </span>

Install Windows Terminal the Microsoft Store. Install posh-git and oh-my-posh:

```powershell
> Install-Module posh-git -Scope CurrentUser
> Install-Module oh-my-posh -Scope CurrentUser
```

Then run

```powershell
> notepad $PROFILE
```

and replace any existing profile with **./terminal/Microsoft.Powershell_profile.ps1**. Powerline fonts are needed to get prompt symbols to display correctly. In a temporary folder run:

```powershell
> git clone https://github.com/powerline/fonts.git --depth=1
> fonts\install.ps1
```

Now replace the default Windows Terminal Settings with **./terminal/settings.json**.

## <a id="wsl"></a> <img src="../img/wsl.png" alt="wsl" width="20"/> <span style="font-size:larger;"> Windows Subsystem for Linux (WSL2) </span>

### Install

Enable WSL:

```powershell
> dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
> dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Then run the following:

```powershell
> wsl --set-default-version 2
```

This will output an error message. Follow the link in the error message and install the update for WSL 2. When done, rerun the original command:

```powershell
> wsl --set-default-version 2
```

Go to the Microsoft Store and install Ubuntu. Once done, both **Ubuntu.exe** and **wsl.exe** will now open bash. Update the fresh install:

```powershell
> sudo apt-get update
```

### Importing an existing WSL setup to a new system

Follow these steps:

1. Make a note of your existing distribution name and version
2. Create a backup file for your distribution using the command:

```powershell
> wsl --export <distribution-name> TarFileLocation
```

3. On your new system, complete a fresh WSL setup using exactly the same distribution as that to be imported (down to the same version). When prompted to, don't create a new user for the distribution - just close the window
4. Locate the **%localappdata%\packages** folder in file explorer and find the subfolder where the new distribution was installed, e.g:

**C:\Users\\%USERPROFILE\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState**

5. Open Powershell and unregister this newly installed distribution via:

```powershell
> wsl --unregister <new-install-name>
```

While this removes the new distribution, the Ubuntu appx package is still installed. This can be verified by checking the start menu for the distribution icon.

6. You can finally run the import to inject your customized distribution. Note in the command below that the folder for install must be the location of the original install mentioned in step 4. The distribution name likely needs to be the same too, e.g:

```powershell
> wsl --import <distribution-name> C:\Users\\%USERPROFILE\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState TarFileLocation
```

7. Run the distribution, and a terminal window should open and prompt a login. Verify your files are there.
8. The last step is to configure the default user for the newly installed distribution, so the shell opens using the login details from your import:

```powershell
> <distribution-executable> config --default-user <username>
```

## <a id="mingw"></a> <img src="../img/mingw.png" alt="mingw" width="23"/> <span style="font-size:larger;"> MinGW </span>

Search for and download the latest mingw-64 installer, likely found at https://sourceforge.net/projects/mingw-w64/. Follow the install instructions, then add the location of the mingw binaries to Windows' `PATH` once done. By default, they will be located here:

    C:\Program Files\mingw64\bin

Depending on the version installed, it may also include prebuilt binaries for clang tooling.

## <a id="ccpp"></a> <img src="../img/cpp.png" alt="drawing" width="20"/> <span style="font-size:larger;"> C/C++ </span>

With MinGW installed and it's binaries added to `PATH`, VSCode can be used as a Windows development environment for applications written in C/C++. Excluding a possible need to rename 'mingw32-make' to 'make' in the mingw64/bin folder, there is no additional setup needed.

## <a id="python"></a> <img src="../img/python.png" alt="python" width="20"/> <span style="font-size:larger;"> System Python </span>

Install the latest version of Python for Windows found at https://www.python.org/downloads/windows/. When running the installer, opt to add Python to `PATH` and make sure Python intalls for the current user only (i.e, to AppData). The installer will install Python, pip, IDLE and the py launcher.

The py launcher is a utility that can be used to locate and run a specific version of Python installed on the system. This is useful if multiple Python installations are present and need to be distinguished. For example, to invoke the latest version of Python 3.x simply run:

```powershell
> py -3
```

Once Python is installed, first upgrade pip:

```powershell
> pip install --upgrade pip
```

Then install virtualenv:

```powershell
> pip install virtualenv
```

Then create and install packages to virtual environments for projects as you normally would.

## <a id="anaconda"></a> <img src="../img/anaconda.png" alt="anaconda" width="20"/> <span style="font-size:larger;"> Anaconda </span>

Install the latest of version of Anaconda for Windows, found at https://www.anaconda.com/products/individual. If you intend the version of Python shipped with Anaconda to be the default used, add the location of the anaconda3 directory to Windows' `PATH`, usually found at **C:\Users\<username>\anaconda3\\**. Then make sure that `PATH` reads in the location of anaconda3 prior to reading in the location of any other Python executables on the system. It is possible to have system Python and Anaconda installed side by side and managed by the py launcher. Once done, add the location of conda to `PATH`, found at **C:\Users\<username>\anaconda3\Scripts\\**.

To enable conda in Powershell, run the following:

```powershell
> conda init powershell
> conda config --set auto_activate_base false
```

To create a new environment, run:

```powershell
> conda create -n envName python=<version>
```

To activate an environment:

```powershell
> conda activate envName
```

To deactivate:

```powershell
> conda deactivate
```

## <a id="node"></a> <img src="../img/node.png" alt="node" width="20"/> <span style="font-size:larger;"> Node </span>

### Install

Steps below follow https://docs.microsoft.com/en-us/windows/nodejs/setup-on-windows.

First install node version manager for windows (windows-nvm). Check https://github.com/coreybutler/nvm-windows to check on the status of the project, then head over to */releases* to download the latest installer zip. Unzip and run the installer.

Install the latest stable version of node via:

```powershell
> nvm list available
> node install <latest LTS from list results>
```

You can install the latest (non-stable) version of node alongside the one above via:

```powershell
> nvm install latest
```

After installing, you need to select which version of node is active before it can be used. Run the following:

```powershell
> nvm use <version>
```

To change the version of node used for a new project, run the above command from the projects root directory with a specific version.

You can check which versions of node are installed at any time via:

```powershell
> nvm ls
```

## <a id="git"></a> <img src="../img/git.png" alt="git" width="20"> <span style="font-size:larger;"> Git </span>

Use the installer found at https://git-scm.com/download/win. Set config as normal and generate an ssh key.

## <a id="npp"></a> <img src="../img/notepad-plus-plus.png" alt="npp" width="20"> <span style="font-size:larger;"> Notepad++ </span>

After installing using the latest installer found at https://notepad-plus-plus.org/downloads/, install the following plugins:

1. MarkdownViewer++ (check 'syncronise scrolling' in the plugin settings, and set to work with .md and .txt)
2. PythonScript
3. Visual Studio Line Copy
4. NppExport
5. DSpellCheck

Then replace stock notepad with Notepad++ everywhere by editing the registry. Using CMD, run the following if 32 bit Notepad++ is installed:

```cmd
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"%ProgramFiles(x86)%\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f
```

For 64 bit:

```cmd
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"%ProgramFiles%\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f
```