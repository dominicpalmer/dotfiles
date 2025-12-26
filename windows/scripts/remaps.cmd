@echo off
set ahkPath="C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
set scriptPath="%dotfiles%\windows\autohotkey\remaps.ahk"

start "" %ahkPath% %scriptPath%
