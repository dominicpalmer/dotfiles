#Requires AutoHotkey v2.0

ids := WinGetList()
for current_id in ids
{
    WinMaximize("ahk_id " current_id)
}