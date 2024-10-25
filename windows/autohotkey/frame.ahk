; Get a list of all window ids
WinGet, id, List

; Calculate dimensions for approx 80% width and height (with fine tuning)
NewWidth := A_ScreenWidth * 0.8
NewHeight := (A_ScreenHeight * 0.8) + 63
OffsetX := A_ScreenWidth * 0.13
OffsetY := A_ScreenHeight * 0.13

; Resizing VSCode first can be unreliable, so cache to resize last
vscode_windows := []

; Loop over all windows, and resize non-VSCode windows
Loop, %id%
{
    current_id := id%A_Index%

    ; Defer VSCode by class name
    WinGetClass, class, ahk_id %current_id%
    if (class = "Chrome_WidgetWin_1")
    {
        vscode_windows.Push(current_id)
        continue
    }

    ; Skip for PowerToys Run by title
    WinGetTitle, title, ahk_id %current_id%
    if (InStr(title, "PowerToys"))
    {
        continue
    }

    ; Restore the window (if it's maximized)
    PostMessage, 0x112, 0xF120,,, ahk_id %current_id%
    Sleep 50  ; Small delay to let the window restore

    ; Resize and reposition other windows
    DllCall("SetWindowPos", "UInt", current_id, "UInt", 0, "Int", OffsetX, "Int", OffsetY, "Int", NewWidth, "Int", NewHeight, "UInt", 0x0040) ; SWP_NOZORDER
}

; Now loop and resize VSCode windows
for index, vscode_id in vscode_windows
{
    PostMessage, 0x112, 0xF120,,, ahk_id %vscode_id%
    Sleep 50  ; Small delay to let the window restore

    ; Adjust for VSCode's custom borders
    AdjustedWidth := NewWidth - 10
    AdjustedHeight := NewHeight - 6
    AdjustedOffsetX := OffsetX + 5

    DllCall("SetWindowPos", "UInt", vscode_id, "UInt", 0, "Int", AdjustedOffsetX, "Int", OffsetY, "Int", AdjustedWidth, "Int", AdjustedHeight, "UInt", 0x0040) ; SWP_NOZORDER
}
