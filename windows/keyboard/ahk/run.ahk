usingPowerToysRun := true

LWin Up::
    if (usingPowerToysRun && A_PriorKey = "LWin")
        send {LWin Down}{Space Down}{LWin Up}{Space Up}
    else
        send {LWin}
    return
return

LWin & Space::
    usingPowerToysRun := Not usingPowerToysRun
return