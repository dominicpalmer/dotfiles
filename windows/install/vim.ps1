# Creates vimrc symbolic links

function New-Symlink {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true)]
    [string] $Link,

    [Parameter(Mandatory=$true)]
    [string] $Target
  )

  if (Get-Item -Path $Link -ErrorAction Ignore) {
    Remove-Item $Link
  }

  New-Item -ItemType SymbolicLink -Path $Link -Target $Target
}

New-Symlink "$HOME/.ideavimrc" "$Dotfiles\common\jetbrains\.ideavimrc"
New-Symlink "$HOME/.vscodevimrc" "$Dotfiles\common\vscode\.vscodevimrc"
New-Symlink "$HOME/.vsvimrc" "$Dotfiles\windows\vs\.vsvimrc"
