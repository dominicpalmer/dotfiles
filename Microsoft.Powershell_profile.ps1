Set-ExecutionPolicy -Scope CurrentUser Unrestricted
$global:DefaultUser = [System.Environment]::UserName
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster