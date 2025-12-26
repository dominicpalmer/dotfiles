#Requires AutoHotkey v2.0

ids := WinGetList()
for current_id in ids
{
    try WinMaximize("ahk_id " current_id)
}