# AHK keybindings

$TaskName = "keybindings"
if (Get-ScheduledTask | Where-Object { $_.TaskName -like $TaskName }) {
  Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action = New-ScheduledTaskAction -Execute "$Dotfiles\windows\keyboard\ahk\keybindings.ahk"
Register-ScheduledTask -Trigger $Trigger -Action $Action -TaskPath "AutoHotkey" -TaskName $TaskName -RunLevel Highest
Start-ScheduledTask -TaskName "AutoHotkey\$TaskName"

