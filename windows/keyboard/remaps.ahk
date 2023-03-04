#SingleInstance Force

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

#h::SendInput {Left}
#j::SendInput {Down}
#k::SendInput {Up}
#l::SendInput {Right}

CapsLock::Esc
RCtrl::CapsLock
RAlt::Ctrl

; Flow Launcher search
LWin Up::
    if (A_PriorKey = "RWin")
        Send {RWin}
    else if (A_PriorKey = "LWin")
        Send !{Space}
return

; Flow Launcher run
LWin & `;::
    Send !{Space}
    SendInput >{Space}
return
