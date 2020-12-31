# Unix Setup

## <img src="img/bash.png" alt="bash" width="20"/> <span style="font-size:larger;">Bash</span> 
Before configuring Bash running in WSL2, setup Windows Terminal with Powerline (specified below). This is so that Bash can use fonts from use the system host (Windows). When done, work through the following guide: https://medium.com/@earlybyte/powerline-for-bash-6d3dd004f6fc.

## <img src="img/gnu.jpg" alt="gnu" width="20"/> <span style="font-size:larger;">Build Essential and Clang Tools for C/C++</span> 
Install gcc, gdb, make and other GNU utilities via:

```bash
$ sudo apt update
$ sudo apt install build-essential
```

For C/C++ projects, create a **.vscode/c_cpp_properties.json** file to store build configuration details such includePath, compilerPath, cppStandard, etc. Also create a **.vscode/launch.json** file to store debugging details such as debugger executable location, miDebuggerPath, setupCommands, etc.

Finally in the global **settings.json** or alternatively in a workspace **settings.json**, include a line that specifies the default search path for external libraries:

    "C_Cpp.default.includePath": ["location1", "location2"]

This default path will now also be searched in addition to the paths specified in **.vscode/c_cpp_properties.json**. If this settings is changed in the global **settings.json**, it will apply to every C/C++ project created in VSCode.

Install Clang, Clang-Tidy and Clang-Format as follows:

```bash
$ sudo apt install clang
$ sudo apt install clang-tidy
$ sudo apt install clang-format
```

Create .clang-tidy and .clang-format files with check configuration at the root of C++ projects.

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

Set username, email, default branch name and default editor as follows:

```bash
$ git config --global user.name "username"
$ git config --global user.email "email@email.com"
$ git config --global init.defaultBranch main
$ git config --global core.editor code
```

Then set autocrlf to **input**, to ensure crlf's are converted to lf's during a push, and crlf's are preserved during a pull.

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

## <img src="img/mingw.png" alt="mingw" width="23"/> <span style="font-size:larger;"> MinGW </span>
Search for and download the latest mingw-64 installer, likely found at https://sourceforge.net/projects/mingw-w64/. Follow the install instructions, then add the location of the mingw binaries to Windows' PATH once done. By default, they will be located here:

    C:\Program Files\mingw64\bin

## <img src="img/cpp.png" alt="drawing" width="20"/> <span style="font-size:larger;"> C/C++ </span>
With MinGW installed and it's binaries added to PATH, VSCode can be used as a Windows development environment for applications written in C/C++. Excluding a possible need to rename 'mingw32-make' to 'make' in the MinGW folder, there is no additional setup needed beyond that of creating Windows specific VSCode project files for C/C++ in the **.vscode** folder. To use Windows libraries, make sure they are included in the **C_Cpp.default.includePath** setting in **settings.json**.

## <img src="img/anaconda.png" alt="anaconda" width="20"/> <span style="font-size:larger;"> Anaconda </span>
Install the latest of version of Anaconda for Windows, found at https://www.anaconda.com/products/individual. Add the location of the anaconda3 directory to Windows' PATH, usually found at **C:\Users\username\anaconda3\\**. Add the location of conda to PATH, found at **C:\Users\username\anaconda3\Scripts\\**. 

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
Use the installer found at https://git-scm.com/download/win. Set username, email, default branch, autocrlf, and optionally generate an ssh key as specified in the Unix setup.