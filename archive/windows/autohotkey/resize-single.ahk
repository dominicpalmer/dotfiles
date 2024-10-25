Run, notepad.exe
WinWait, ahk_class Notepad
WinActivate
WinMove A,, A_ScreenWidth*0.13, A_ScreenHeight*(1 - 0.83), A_ScreenWidth*(1 - 0.13) - 200, A_ScreenHeight*0.83 - 25