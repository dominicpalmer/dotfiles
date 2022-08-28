# Creates a scheduled task to run AHK keybindings script at logon

# Delete any existing task of the same name
$TaskName = "keybindings"
if (Get-ScheduledTask | Where-Object { $_.TaskName -like $TaskName }) {
  Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

# Create a new task to run at logon
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Action = New-ScheduledTaskAction -Execute "$Dotfiles\windows\keyboard\ahk\keybindings.ahk"
Register-ScheduledTask -Trigger $Trigger -Action $Action -TaskPath "AutoHotkey" -TaskName $TaskName -RunLevel Highest
Start-ScheduledTask -TaskName "AutoHotkey\$TaskName"
