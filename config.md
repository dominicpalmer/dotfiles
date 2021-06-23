# Unix config

This contains notes on installation and configuration for day one unix system changes.

Contents:

1. [Bash](#bash)
2. [Build Essential](#build-essential)
3. [Python](#python)
4. [Anaconda](#anaconda)
5. [Node](#node)
6. [VSCode](#vscode)
7. [Firefox](#firefox)
8. [Git](#git)

## <a id="bash"></a> <img src="img/bash.png" alt="bash" width="20"/> <span style="font-size:larger;">Bash</span>

Use the **.bashrc** found in this repo at **./bash/.bashrc**.

Work through this guide to get Bash prompt Powerline fonts installed: https://medium.com/@earlybyte/powerline-for-bash-6d3dd004f6fc.

## <a id="build-essential"></a> <img src="img/llvm.png" alt="llvm" width="25"/> <span style="font-size:larger;">Build Essential, Clang Tools and Valgrind for C/C++</span>

### Install

Install gcc, gdb, make and other GNU utilities via:

```bash
$ sudo apt update
$ sudo apt install build-essential
$ sudo apt install gdb
```

Install Clang, Clang-Tidy and Clang-Format via:

```bash
$ sudo apt install clang
$ sudo apt install clang-tidy
$ sudo apt install clang-format
```

Install valgrind via:

```bash
$ sudo apt install valgrind
```

To use valgrind, simply pass an executable along with any of valgrinds options:

```bash
$ valgrind --leak-check-full ./program
```

### VSCode C/C++ Config

Create **.clang-tidy** and **.clang-format** files at the root of C++ projects. VSCode can be setup to run clang-format on save using the Microsoft C/C++ extension. The third party extension 'Clang-Tidy' can be used to run clang-tidy on save.

In the global VSCode **settings.json** or alternatively in each projects workspace **settings.json**, include a line that specifies the default search path for libraries:

    "C_Cpp.default.includePath": ["location1", "location2"]

If this setting is changed in the global **settings.json**, it will apply to every C/C++ project created in VSCode.

For each new C/C++ project, create a **.vscode/c_cpp_properties.json** file to store project specific configuration details such `intellisenseMode`, `includePath`, `compilerPath`, `cppStandard`, etc. Make sure that each **.vscode/c_cpp_properties.json** file includes the default `includePath` defined in **settings.json** as one of the parameters. This way, the default path will now also be searched in addition to the project specific paths specified in **.vscode/c_cpp_properties.json**. Also make sure the **c_cpp_properties.json** settings match the specific tooling used for the project, in particular the intellisense mode, else VSCode may give misdirected warnings about missing headers.

Also create a **.vscode/launch.json** file to store launch configurations including the location of the executable, MIMode, command line arguments, etc.

### Intellisense

It is important to note that **c_cpp_properties.json** only impacts _VSCode intellisense_ for the project in which it is included. So by setting a default C/C++ `includePath` in a local or global **settings.json**, and setting an `includePath` in the project specific **c_cpp_properties.json** that points to this default, all you are doing is making _intellisense in VSCode_ aware of the existence of these default headers for this specific project, thus providing intellisense functionality. If all `includePath` parameters in the VSCode config files are omitted, it is _VSCode_ that has no way to enforce intellisense. In such a case, VSCode would throw countless warnings about missing symbols, however compliation might still work. This is because most compilers perform their own predefined searches for headers during compilation.

Hence the process of configuring the `includePath` in the VSCode config files is simply to align the VSCode intellisense search as closely as possible with the underlying compiler search, so intellisense mirrors what the compiler can do and intellisense warnings make sense. Note that there may be other paths that the compiler searches for but intellisense doesn't. So if intellisense says a header is missing and is throwing warnings, it might actually be available to the compiler, in which case compilation would succeed regardless.

### External libraries

If you require any additional libraries installed elsewhere for specific projects (e.g. Boost), then to get _intellisense_ working you need to include the path to these libraries in **settings.json** or the projects **c_cpp_properties.json**. To get the _compiler_ to find these libraries, set up a **tasks.json** file with a relevant includePath to force the compiler to look for them when linking, or just use a makefile of some kind.

## <a id="python"></a> <img src="img/python.png" alt="python" width="20"/> <span style="font-size:larger;">System Python</span>

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

A new directory called **env_name**  will be created in the projects root directory containing its own **/bin**. To activate the virtual environment, run:

```bash
$ source env_name/bin/activate
```

Pip can now be used to install packages for this isolated environment. To deactivate the environment:

```bash
$ deactivate
```

### Tools

Install pylint and flake8 static analysers via:

```bash
$ pip install pylint
$ pip install flake8
```

## <a id="anaconda"></a> <img src="img/anaconda.png" alt="anaconda" width="20"/> <span style="font-size:larger;">Anaconda</span>

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

## <a id="node"></a> <img src="img/node.png" alt="node" width="20"/> <span style="font-size:larger;"> Node </span>

### Install

First install node version manager (nvm). Check https://github.com/nvm-sh/nvm/releases for the latest version, then install using:

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/<version>/install.sh | bash
```

Restart bash. Check nvm has installed correctly, then install node via:

```bash
$ nvm install node
$ node --version
```

You can install the latest LTS version of node alongside the one above above via:

```bash
$ nvm install --lts
```

Then change which version of node is active by running:

```bash
$ nvm use <version>
```

To change the version of node used for a new project, run the above command from the projects root directory with a specific version.

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

## <a id="vscode"></a> <img src="img/code.png" alt="code" width="20"/> <span style="font-size:larger;"> VSCode </span>

To install VSCode, run the following from ~$:

```bash
$ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
$ sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
$ sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```

This downloads the Microsoft gpg key and makes it trusted, then makes the apt files available. Once done, install via:

```bash
$ sudo apt-get update
$ sudo apt-get install code
```

To update VSCode, rerun the two commands above.

## <a id="firefox"></a> <img src="img/firefox.png" alt="firefox" width="23"/> <span style="font-size:larger;"> Firefox </span>

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

## <a id="git"></a> <img src="img/git.png" alt="git" width="20"> <span style="font-size:larger;"> Git </span>

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

Then set autocrlf to `input`, to ensure CRLF's are converted to LF's during a push, and CRLF's are preserved during a pull.

```bash
$ git config --global core.autocrlf input
```

To generate and use SSH and/or GPG keys, follow the steps in these guides:

https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh

https://www.theodinproject.com/courses/foundations/lessons/setting-up-git

https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/managing-commit-signature-verification
