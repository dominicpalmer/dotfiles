# Unix Setup

## <img src="img/bash.png" alt="bash" width="20"/> <span style="font-size:larger;">Bash</span> 
Before configuring Bash running in WSL2, setup Windows Terminal with Powerline (specified below). This is so that Bash can use fonts from use the system host (Windows). When done, work through the following guide: https://medium.com/@earlybyte/powerline-for-bash-6d3dd004f6fc.

## <img src="img/gnu.jpg" alt="gnu" width="20"/> <span style="font-size:larger;">Build Essential and Clang Tools for C/C++</span> 
### Install
Install gcc, gdb, make and other GNU utilities via:

```bash
$ sudo apt update
$ sudo apt install build-essential
$ sudo apt install gdb
```
Install Clang, Clang-Tidy and Clang-Format as follows:

```bash
$ sudo apt install clang
$ sudo apt install clang-tidy
$ sudo apt install clang-format
```

Create .clang-tidy and .clang-format files at the root of C++ projects.

### VSCode C/C++ Config
In the global VSCode **settings.json** or alternatively in each projects workspace **settings.json**, include a line that specifies the default search path for libraries:

    "C_Cpp.default.includePath": ["location1", "location2"]

If this setting is changed in the global **settings.json**, it will apply to every C/C++ project created in VSCode.

For each new C/C++ project, create a **.vscode/c_cpp_properties.json** file to store project specific configuration details such intellisenseMode, includePath, compilerPath, cppStandard, etc. Make sure that each **.vscode/c_cpp_properties.json** file includes the default includePath defined in **settings.json** as one of the parameters. This way, the default path will now also be searched in addition to the project specific paths specified in **.vscode/c_cpp_properties.json**. Also make sure the **c_cpp_properties.json** settings match the specific tooling used for the project, in particular the intellisense mode, else VSCode may give misdirected warnings about missing headers.

Also create a **.vscode/launch.json** file to store launch configurations including the location of the executable, MIMode, command line arguments, etc.

### Intellisense
It is important to note that **c_cpp_properties.json** only impacts *intellisense in VSCode* for the project in which it is included. So by setting a default C/C++ includePath in a local or global **settings.json**, and setting an includePath in the project specific **c_cpp_properties.json** that points to this default, all you are doing is making *intellisense in VSCode* aware of the existence of these default headers for this specific project, thus providing intellisense functionality. If all includePath parameters in the VSCode config files are omitted, it is *VSCode* that has no way to enforce intellisense. In such a case, VSCode would throw countless warnings about missing symbols, however compliation might still work. This is because compilers themselves generally perform their own predefined searches for headers during compilation. 

Hence the process of configuring the includePath in the VSCode config files is simply to align the VSCode intellisense search as closely as possible with the underlying compiler search, so intellisense mirrors what the compiler can do and intellisense warnings make sense. Note that there may be other paths that the compiler searches for but intellisense doesn't. So if intellisense says a header is missing and is throwing warnings, it might actually be available to the compiler, in which case compilation would succeed regardless.

### External libraries
If you require any additional libraries installed elsewhere for specific projects (e.g. Boost), then to get *intellisense* working you need to include the path to these libraries in **settings.json** or the projects **c_cpp_properties.json**. To get the *compiler* to find these libraries, set up a **tasks.json** file with a relevant includePath to force the compiler to look for them when linking, or just use a makefile of some kind.

## <img src="img/python.png" alt="python" width="20"/> <span style="font-size:larger;">System Python</span>
### Pip
System python3 will be available at **/usr/bin/python3**. Install pip via:

```bash
$ sudo apt update
$ sudo apt install python3-pip
```

There is generally no need to update pip - doing so installs the latest version in **.local/bin**. To update, run:

```bash
$ python3 -m pip install -U pip
```

### Virtual Environments
To use virtual environments, first install the virtualenv package:

```bash
$ sudo apt update
$ pip install virtualenv
```

Alternatively, install the venv package:

```bash
$ sudo apt update
$ sudo apt install python3-venv
```

Then to create a virtual environment for a given project, run one of the following in its root directory:

```bash
$ python3 -m venv env_name
$ python3 -m virtualenv env_name
```

A new directory called env_name will be created in the projects root directory containing its own **/bin**. To activate the virtual environment, run:

```bash
$ source env_name/bin/activate
```

Pip can now be used to install packages for this isolated environment. To deactivate the environment:

```bash
$ deactivate
```

## <img src="img/anaconda.png" alt="anaconda" width="20"/> <span style="font-size:larger;">Anaconda</span>
### Install
Anaconda is an alternative to using system Python, pip and virtual environments. To install the Anaconda distribution, head to https://www.anaconda.com/products/individual and make a note of the latest installer URL for Linux. It may look something like:

    https://repo.continuum.io/archive/Anaconda3<release>.sh

Download and run the shell script installer in **/tmp** via:

```bash
$ cd /tmp
$ curl -O https://repo.continuum.io/archive/Anaconda3<release>.sh | bash
```

If asked, opt for the installer to not prepend the Anaconda3 install location to PATH in **.bashrc**. Instead, append the following to **.bashrc** once the install is complete:

    . /home/user/anaconda/etc/profile.d/conda.sh

This leaves system Python as the default, but gives the option of temporarily overriding it with Anaconda's Python when needed.

### Environments
To switch to Anaconda's base environment that uses it's own version of Python, run:

```bash
$ conda activate base
```

Then to deactivate Anaconda and revert to using system Python, run:

```bash
$ conda deactivate
```

Create additional Anaconda environments that optionally use a specific version of Python using:

```bash
$ conda create --name envName [python=<Python-version>]
```

### Update
To update Anaconda to a specific version, run the following:

```bash
$ conda update anaconda=<version>
```

To update a specific Anaconda environment, run:

```bash
$ conda update -n envName --all
```

## <img src="img/node.png" alt="node" width="20"/> <span style="font-size:larger;"> Node </span>
### Install
First install node version manager (nvm). Check https://github.com/nvm-sh/nvm/releases to identify the latest version, then install using:

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/<version>/install.sh | bash
```

Close and reopen bash. Check nvm has installed correctly and then install node via:

```bash
$ nvm install node
$ node --version
```

You can install the latest LTS version of node alongside the one above via:

```bash
$ nvm install --lts
```

Then change which version of node is active by running:

```bash
$ nvm use <version>
```

To set the default version of node that is used, run:

```bash
$ nvm alias default <version>
```

### Update
To update node to a newer version and delete the old version, run the following:

```bash
$ nvm install <new_version> --reinstall-packages-from=<old_version>
$ nvm uninstall <old_version>
```

## <img src="img/code.png" alt="code" width="20"/> <span style="font-size:larger;"> VSCode </span>
To install VSCode, run the following from ~$:

```bash
$ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
$ sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
$ sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```

This downloads the Microsoft gpg key and makes it trusted, then makes the apt files available. Once done, install via:

```bash
$ sudo apt-get upate
$ sudo apt-get install code
```

To update VSCode, rerun the two commands above.

## <img src="img/firefox.png" alt="firefox" width="23"/> <span style="font-size:larger;"> Firefox </span>
To install:

```bash
$ sudo apt install firefox
```

Update Firefox via a full system update:

```bash
$ sudo apt upgrade
```

To uninstall:

```bash
$ sudo apt remove firefox
```

## <img src="img/git.png" alt="git" width="20"> <span style="font-size:larger;"> Git </span>
Install via:

```bash
$ sudo apt install git-all
```

Set username, email and default editor as follows:

```bash
$ git config --global user.name "username"
$ git config --global user.email "email@email.com"
$ git config --global core.editor code
```

Then set autocrlf to **input**, to ensure CRLF's are converted to LF's during a push, and CRLF's are preserved during a pull.

```bash
$ git config --global core.autocrlf input
```

To generate and use SSH and/or GPG keys, follow the steps in these guides: 

https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh

https://www.theodinproject.com/courses/foundations/lessons/setting-up-git

https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/managing-commit-signature-verification

# Windows Setup
## <img src="img/terminal.png" alt="terminal" width="23"/> <span style="font-size:larger;"> Windows Terminal </span>
Install Windows Terminal from the Microsoft Store or elsewhere. Install posh-git and oh-my-posh via:

```powershell
> Install-Module posh-git -Scope CurrentUser
> Install-Module oh-my-posh -Scope CurrentUser
```

Then run

```powershell
> notepad $PROFILE
```

and paste over any existing profile with your own template. Powerline fonts are needed to get symbols to display correctly. In a temporary folder run:

```powershell
> git clone https://github.com/powerline/fonts.git --depth=1
> fonts\install.ps1
```

Now paste over the default Windows Terminal Settings with your own template.

## <img src="img/wsl.png" alt="wsl" width="20"/> <span style="font-size:larger;"> Windows Subsystem for Linux (WSL2) </span>
### Install
Enable WSL via powershell by running:

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

Go to the Microsoft Store (or otherwise) and install Ubuntu (or otherwise). Once done, both **Ubuntu.exe** and **wsl.exe** will now open bash. Update the fresh install via:

```powershell
> sudo apt-get update
```

Then carry out a full Unix setup as specified above.

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

While this removes the new distribution, the Ubuntu appx package is still installed. This can be verified by checking the start menu for the distribution icon

6. You can finally run the import to inject your customized distribution. Note in the command below that the folder for install must be the location of the original install mentioned in step 4. The distribution name likely needs to be the same too, e.g:

```powershell
> wsl --import <distribution-name> C:\Users\\%USERPROFILE\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState TarFileLocation
```

7. Run the distribution, and a console window should open and prompt a login. Verify your files are there.
8. The last step is to configure the default user for the newly installed distribution, so the shell opens using the login details from your import. This can be done with the following command: 

```powershell
> <distribution-executable> config --default-user trawkley
```


## <img src="img/mingw.png" alt="mingw" width="23"/> <span style="font-size:larger;"> MinGW </span>
Search for and download the latest mingw-64 installer, likely found at https://sourceforge.net/projects/mingw-w64/. Follow the install instructions, then add the location of the mingw binaries to Windows' PATH once done. By default, they will be located here:

    C:\Program Files\mingw64\bin

Depending on the version installed, it may include prebuilt binaries for clang and clang-format.

## <img src="img/cpp.png" alt="drawing" width="20"/> <span style="font-size:larger;"> C/C++ </span>
With MinGW installed and it's binaries added to PATH, VSCode can be used as a Windows development environment for applications written in C/C++. Excluding a possible need to rename 'mingw32-make' to 'make' in the mingw64/bin folder, there is no additional setup needed beyond that of creating Windows specific VSCode project files for C/C++ in the **.vscode** folder. To use Windows libraries, make sure they are included in the **C_Cpp.default.includePath** setting in **settings.json**.


## <img src="img/python.png" alt="python" width="20"/> <span style="font-size:larger;"> System Python </span>
Install the latest version of Python for Windows, found at https://www.python.org/downloads/windows/. When running the installer, opt to add Python to PATH and make sure Python intalls for the current user only (i.e to AppData). The installer will install Python, pip, IDLE and the py launcher. 

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

## <img src="img/anaconda.png" alt="anaconda" width="20"/> <span style="font-size:larger;"> Anaconda </span>
Install the latest of version of Anaconda for Windows, found at https://www.anaconda.com/products/individual. If you intend the version of Python shipped with Anaconda to be the default used, add the location of the anaconda3 directory to Windows' PATH, usually found at **C:\Users\username\anaconda3\\**. Then make sure that PATH reads in the location of anaconda3 prior to reading in the location of any other Python executables on the system. It is possible to have system Python and Anaconda installed side by side and managed by the py launcher. Once done, add the location of conda to PATH, found at **C:\Users\username\anaconda3\Scripts\\**.

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

## <img src="img/git.png" alt="git" width="20"> <span style="font-size:larger;"> Git </span>
Use the installer found at https://git-scm.com/download/win. Set username, email, autocrlf, and optionally generate an ssh key as specified in the Unix setup.

## <img src="img/notepad-plus-plus.png" alt="npp" width="20"> <span style="font-size:larger;"> Notepad++ </span>
After installing, apply the following preferences:

1. Use defaultstylers style, but override global config using font Consolas, font size 9, and background colour as rgb(255, 243, 234). Enforce the override by ticking 'Enable global background color' and 'Enable global font/font size' 
2. General: Check hide toolbar, show document list panel and use alternate icons
3. Editing: Set folder margin 'None', border width 0, vertical edge 80, check display line number, and keep selection when right clicking outside

Install the following plugins:
1. MarkdownViewer++ (check 'syncronise scrolling' in the plugin settings, and set to work with .md and .txt)
2. PythonScript