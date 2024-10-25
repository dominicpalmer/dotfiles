; Get a list of all window ids
WinGet, id, List

; Loop over each window
Loop, %id%
{
    current_id := id%A_Index%

    ; Get the window title
    WinGetTitle, title, ahk_id %current_id%

    if (InStr(title, "PowerToys"))
    {
        ; Skip PowerToys Run, it's not supposed to be maximised
        continue
    }

    ; Maximize the window
    WinMaximize, ahk_id %current_id%
}
