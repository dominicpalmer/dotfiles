CapsLock::Esc
RCtrl::CapsLock
RAlt::Ctrl

#h::SendInput {Left}
#j::SendInput {Down}
#k::SendInput {Up}
#l::SendInput {Right}

; Winkey up to Alt Space, for Flow Launcher
LWin Up::
    If (A_PriorKey = "LWin")
        Send !{Space}
return

; Regain Winkey+r
LWin & r::
    Send !{Space}
    SendInput >
    SendInput {Space}
return
