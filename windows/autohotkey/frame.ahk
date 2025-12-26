#Requires AutoHotkey v2.0

; Get a list of all window ids
ids := WinGetList()
NewWidth := A_ScreenWidth * 0.8

; Calculate dimensions for approx 80% width and height (with fine tuning)
NewHeight := (A_ScreenHeight * 0.8) + 105
OffsetX := A_ScreenWidth * 0.13
OffsetY := A_ScreenHeight * 0.13
vscode_windows := []

; Loop over all windows, and resize non-VSCode windows
for current_id in ids
{
    try
    {
        winClass := WinGetClass("ahk_id " current_id)

        if (winClass = "Chrome_WidgetWin_1")
        {
            vscode_windows.Push(current_id)
            continue
        }

        PostMessage(0x112, 0xF120, , , "ahk_id " current_id)
        Sleep 50

        DllCall("SetWindowPos"
            , "Ptr", current_id
            , "Ptr", 0
            , "Int", OffsetX
            , "Int", OffsetY
            , "Int", NewWidth
            , "Int", NewHeight
            , "UInt", 0x0040)
    }
}

; Now loop and resize VSCode windows
for vscode_id in vscode_windows
{
    try
    {
        PostMessage(0x112, 0xF120, , , "ahk_id " vscode_id)
        Sleep 50

        AdjustedWidth := NewWidth - 10
        AdjustedHeight := NewHeight - 6
        AdjustedOffsetX := OffsetX + 5

        DllCall("SetWindowPos"
            , "Ptr", vscode_id
            , "Ptr", 0
            , "Int", AdjustedOffsetX
            , "Int", OffsetY
            , "Int", AdjustedWidth
            , "Int", AdjustedHeight
            , "UInt", 0x0040)
    }
}