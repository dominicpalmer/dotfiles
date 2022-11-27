#SingleInstance Force

CapsLock::Esc
RCtrl::CapsLock
RAlt::Ctrl

LWin & h::SendInput {Left}
LWin & j::SendInput {Down}
LWin & k::SendInput {Up}
LWin & l::SendInput {Right}

; LWin-Up to Alt+Space, for Flow Launcher search
LWin Up::
    If (A_PriorKey = "LWin")
        Send !{Space}
return

; Flow Launcher run command with RWin+r
RWin & r::
    Send !{Space}
    SendInput >{Space}
return
