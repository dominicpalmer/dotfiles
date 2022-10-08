; CapsLock to Esc
CapsLock::Esc

; RCtrl to Capslock
RCtrl::CapsLock

; AltGr to Ctrl
RAlt::Ctrl

; Windows key controls
#h::SendInput {Left}
#j::SendInput {Down}
#k::SendInput {Up}
#l::SendInput {Right}

; Remap virtual desktop shortcuts
#o::^#d
#i::^#F4
#u::#Tab
#n::^#Left
#m::^#Right

; PowerToys Run via the Windows key
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
