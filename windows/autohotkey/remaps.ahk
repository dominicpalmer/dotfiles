#SingleInstance Force

; + = Shift
; ^ = Control
; ! = Alt
; # = WinKey

; -------------------------- Sleep/lock workstation
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

; -------------------------- PowerToys run
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

; -------------------------- Winkey navigation and text modification
#h::SendInput {Left}
#j::SendInput {Down}
#k::SendInput {Up}
#l::SendInput {Right}
#y::SendInput {Home}
#o::SendInput {End}
#i::SendInput ^{Delete}
#u::SendInput ^{Backspace}
#n::Send {Home}{Shift down}{End}{Shift up}

; -------------------------- CopyQ cycle items forward and back, cancel, clear
#v::Send ^!{y}
#b::Send ^!{u}
#c::Send ^!{i}
#g::
    ; CopyQ
    Send ^!{t}

    ; System
    Clipboard=
return

; -------------------------- Escape, capslock
CapsLock::Escape
RCtrl::CapsLock
RAlt::Ctrl

#IfWinActive, ahk_exe datagrip64.exe
{
    ; IdeaVim works in the DataGrip filter bar, but <Esc> doesn't exit insert
    ; mode. DataGrip intercepts <Esc> and moves the cursor focus instead. <C-[>
    ; does exit insert mode, so send it instead of <Esc> for DataGrip only.
    CapsLock::^[
}
