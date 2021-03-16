# <img src="../img/visual-studio.png" alt="vs" width="25"/> <span style="font-size:larger;">Visual Studio setup</span> 

Install extensions, apply settings.
## 1. Extensions
Install the following:
- Roslynator
- Output Enhancer
- File Icons
- VSBlockJumper
- Trailing Whitespace Visualiser
- Color Themes for Visual Studio
- Visual Studio Spell Checker
- CodeMaid
- Align Assignments
- Fix Mixed Tabs
- Match Margin
- Editor Guidelines
- ILSpy
- Markdown Editor

## 2. Applying settings
Either import the .vssettings file directly into Visual Studio, or manually apply the following:

### i) Tools->Settings
- Environment/Tabs and Windows: Insert new tabs to the right of existing tabs
- Environment/Fonts and Colors: First show settings for Environment, then set font to Leelawadee UI with font size 8
- Environment/Fonts and Colors: Set font size 8 for all of the following:
    - Statement completion
    - Editor tooltip
    - [All text tool windows]
    - Command window
    - Find results window
    - F# interactive
    - Immediate window:
    - Package manager window
    - Output window
    - Folder difference
    - [Watch, locals and autos tool windows]
    - Autos window
    - Callstack window
    - Datatips
    - Debug location toolbar
    - Locals window
    - Parallel stacks/task/watch window
    - Threads window
    - Watch windows
- Environment/Keyboard: Apply Visual Studio Code keybindings
- Text Editor: Show structure guidelines
- Text Editor: Disable selection margin

### ii) UI
- Get rid of all UI toolbar buttons except Solution Configurations, Solution Platforms, Debug Target, Debug Type, and Extensions
- Place Solution Explorer, Team Explorer, Properties and Toolbox on the left
- Place Error List, Output and other associated windows on the right
- Text editor window takes unobstructed center stage
- Toggle word wrap on the Output window
- Remove all columns on the Error List window except Severity, Code, Description, File and Line
- 'Show all files' in Solution Explorer for every project
- Set text editor scaling to 85%

### iii) Extension dependent changes
- Environment/General: Set colour theme to Green
- Set VSBlockJumper keybindings to be as follows:
    - Edit.JumpUp: Alt + n
    - Edit.JumpDown: Alt + m
    - Edit.JumpSelectUp: Alt + Shift + n
    - Edit.JumpSelectDown: Alt + Shift + m

## 3. Optional changes
- Uninstall the Live Share component, which will remove the live share button from the toolbar
 