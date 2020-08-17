# Unix Setup

## <img src="img/gnu.jpg" alt="drawing" width="20"/> <span style="font-size:larger;">Build Essential</span> 
Install gcc, gdb, make and other GNU utilities via:

    sudo apt update
    sudo apt install build-essential
    gcc --version


## <img src="img/python.png" alt="drawing" width="20"/> <span style="font-size:larger;">System Python</span>
### Pip
System python3 will be available at **/usr/bin/python3**. Install pip via:

    sudo apt update
    sudo apt install python3-pip
    pip --version

There is generally no need to update pip. Doing so installs the latest version in **.local/bin**. This is achieved by running:

    python3 -m pip install -U pip

### Virtual Environments
To use virtual environments, first install the venv package:

    sudo apt update
    sudo apt install python3-venv

Then to create a virtual environment for a given project, run the following in its root directory:

    python3 -m venv envName

A new directory called envName will be created in the projects root directory containing its own **/bin**. To activate the virtual environment, run:

    source envName/bin/activate

Pip can now be used to install packages for this isolated environment. To deactivate the environment:

    deactivate


## <img src="img/anaconda.png" alt="drawing" width="20"/> <span style="font-size:larger;">Anaconda</span>
### Install
Anaconda is an alternative to using system Python, pip and virtual environments. To install the Anaconda distribution, head to https://www.anaconda.com/products/individual and make a note of the latest installer URL for Linux. It may look something like:

    https://repo.continuum.io/archive/Anaconda3<release>.sh

Download and run the shell script installer in **/tmp** via:

    cd /tmp
    curl -O https://repo.continuum.io/archive/Anaconda3<release>.sh | bash

If asked, opt for the installer to not prepend the Anaconda3 install location to PATH in **.bashrc**. Instead, append the following to **.bashrc** once the install is complete:

    . /home/user/anaconda/etc/profile.d/conda.sh

This leaves system Python as the default, but gives the option of temporarily overriding it with Anaconda's Python when needed.

### Environments
To switch to Anaconda's base environment that uses it's own version of Python, run:

    conda activate base

Then to deactivate Anaconda and revert to using system Python, run:

    conda deactivate

Create additional Anaconda environments that optionally use a specific version of Python using:

    conda create --name envName [python=<Python-version>]

### Update
To update Anaconda to a specific version, run the following:

    conda update anaconda=<version>

To update a specific Anaconda environment, run:

    conda update -n envName --all


## <img src="img/node.png" alt="drawing" width="20"/> <span style="font-size:larger;"> Node </span>
### Install
First install node version manager (nvm). Check https://github.com/nvm-sh/nvm/releases to identify the latest version, then install using:

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/<version>/install.sh | bash

Close and reopen bash. Check nvm has installed correctly and then install node via:

    nvm install node
    node --version

You can install the latest LTS version of node alongside the one above via:

    nvm install --lts

Then change which version of node is active by running:

    nvm use <version>

To set the default version of node that is used, run:

    nvm alias default <version>

### Update
To update node to a newer version and delete the old version, run the following:

    nvm install <new_version> --reinstall-packages-from=<old_version>
    nvm uninstall <old_version>

## <img src="img/code.png" alt="drawing" width="20"/> <span style="font-size:larger;"> VSCode </span>
To install VSCode, run the following from ~$:

    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

This downloads the Microsoft gpg key and makes it trusted, then makes the apt files available. Once done, install via:

    sudo apt-get upate
    sudo apt-get install code

To update VSCode, rerun the two commands above.

## <img src="img/firefox.png" alt="drawing" width="23"/> <span style="font-size:larger;"> Firefox </span>
To install:

    sudo apt install firefox

Update Firefox via a full system update:

    sudo apt upgrade

To uninstall:

    sudo apt remove firefox

# Windows Setup
## <img src="img/mingw.png" alt="drawing" width="23"/> <span style="font-size:larger;"> MinGW </span>
Search for and download the latest mingw-64 installer, likely found at https://sourceforge.net/projects/mingw-w64/. Follow the install instructions, then add the location of the mingw binaries to Windows' PATH once done. By default, they will be located here:

    C:\Program Files\mingw64\bin

## <img src="img/cpp.png" alt="drawing" width="20"/> <span style="font-size:larger;"> C/C++ </span>
With MinGW installed and it's binaries added to PATH, VSCode can be used as a development environment for C/C++ programs. 

In each new project, create a **.vscode/c_cpp_properties.json** file to store build configuration details such includePath, compilerPath, cppStandard, etc. Also create a **.vscode/launch.json** file to store debugging details such as debugger executable location, miDebuggerPath, setupCommands, etc.

Finally in the global **settings.json** or alternatively in a workspace **settings.json**, include a line that specifies the default search path for external libraries:

    "C_Cpp.default.includePath": ["location1", "location2"]

This default path will now also be searched in addition to the paths specified in **.vscode/c_cpp_properties.json**. If this settings is changed in the global **settings.json**, it will apply to every C/C++ project created in VSCode.

## <img src="img/anaconda.png" alt="drawing" width="20"/> <span style="font-size:larger;"> Anaconda </span>
Install the latest of version of Anaconda for Windows, found at https://www.anaconda.com/products/individual. Add the location of the anaconda3 directory to Windows' PATH, usually found at **C:\Users\username\anaconda3\\**. Add the location of conda to PATH, found at **C:\Users\username\anaconda3\Scripts\\**. 

To enable conda in Powershell, run the following:

    conda init powershell
    conda config --set auto_activate_base false

To create a new environment, run:

    conda create -n envName python=<version>

To activate an environment:

    conda activate envName

To deactivate:

    conda deactivate

## <img src="img/wsl.png" alt="drawing" width="20"/> <span style="font-size:larger;"> Windows Subsystem for Linux (WSL) </span>
Enable WSL via powershell by running:

    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Then run the following:

    wsl --set-default-version 2

This will output an error message. Follow the link in the error message and install the update for WSL 2. When done, rerun the original command:

    wsl --set-default-version 2

Go to the Microsoft Store (or otherwise) and install Ubuntu (or otherwise). Once done, both **Ubuntu.exe** and **wsl.exe** will now open bash. Update the fresh install via:

    sudo apt-get update

Then carry out a full Unix setup as specified above.