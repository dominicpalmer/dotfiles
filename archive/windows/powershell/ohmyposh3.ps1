# To use oh-my-posh V3 (executable version), remove these lines from the profile
Import-Module oh-my-posh
Set-Theme doms-theme

# Then add this line at the end
oh-my-posh init pwsh --config "$env:dotfiles\windows\powershell\doms-ohmyposh3-theme.json" | Invoke-Expression