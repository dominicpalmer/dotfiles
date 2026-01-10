#Requires AutoHotkey v2.0

#SingleInstance Force

;+ = Shift
;^ = Control
;! = Alt
;# = WinKey

; -------------------------- Sleep/lock workstation
; Set initial registry value to disable lock workstation
RegWrite 1, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"

; Windows sleep
#`::{
    ; Win+` for sleep (using standard hotkey format instead)
    RegWrite 0, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
    DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
    Reload()
}

; Windows lock workstation
#\::{
    ; Win+\ for lock (using standard hotkey format)
    RegWrite 0, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
    DllCall("LockWorkStation")
    Reload()
}

; -------------------------- Winkey navigation and text modification
#h::SendInput "{Left}"
#j::SendInput "{Down}"
#k::SendInput "{Up}"
#l::SendInput "{Right}"
#y::SendInput "{Home}"
#o::SendInput "{End}"
#i::SendInput "^{Delete}"
#u::SendInput "^{Backspace}"
#n::Send "{Home}{Shift down}{End}{Shift up}"

; -------------------------- CopyQ clipboard management
#v::Send "^!y"
#b::Send "^!u"
#c::Send "^!i"
#f::{
    ; Clear CopyQ
    Send("^!t")

    ; Clear system clipboard
    Clipboard := ""
}

; -------------------------- Key remappings
CapsLock::Esc
RCtrl::CapsLock
RAlt::Ctrl
