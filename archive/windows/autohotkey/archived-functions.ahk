; -------------------------- Toggle between instances of the same application
!`::
    WinGetClass, OldClass, A
    WinGet, ActiveProcessName, ProcessName, A
    WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%

    if WinClassCount = 1
        Return

    loop, 2 {
        WinSet, Bottom,, A
        WinActivate, ahk_exe %ActiveProcessName%
        WinGetClass, NewClass, A

        if (OldClass <> "CabinetWClass" or NewClass = "CabinetWClass")
            break
    }
return
