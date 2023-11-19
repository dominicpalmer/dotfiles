#SingleInstance Force

; --------------------------- Sleep/lock workstation
; On lock or sleep:
; 1. DisableLockWorkstation registry key is momentarily set to 0, and the computer is locked or put to sleep.
; 2. This script is reloaded and DisableLockWorkstation is set back to 1, so that the Win+l remap works again.
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1

LWin & `::
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    Reload
return

LWin & \::
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
    DllCall("LockWorkStation")
    Reload
return

; --------------------------- Toggle between instances of the same application
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

; --------------------------- Winkey navigation
#h::SendInput {Left}
#j::SendInput {Down}
#k::SendInput {Up}
#l::SendInput {Right}
#y::SendInput {Home}
#o::SendInput {End}

; --------------------------- Winkey text modification
#i::SendInput ^{Delete}
#u::SendInput ^{Backspace}
#n::Send {Home}{Shift down}{End}{Shift up}

; --------------------------- Winkey CopyQ cycle items forward
#v::Send ^!{y}

; --------------------------- Winkey clear system and CopyQ clipboards
#g::
    ; CopyQ
    Send ^!{t}

    ; System
    Clipboard=
return

; --------------------------- Escape and capslock
CapsLock::Esc
RCtrl::CapsLock
RAlt::Ctrl

; --------------------------- Flow launcher
; Search with LWin
LWin Up::
    if (A_PriorKey = "RWin")
        Send {RWin}
    else if (A_PriorKey = "LWin")
        Send !^{Space}
return

; Run with LWin+;
LWin & `;::
    Send !^{Space}
    SendInput >{Space}
return
