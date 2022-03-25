Import-Module oh-my-posh
oh-my-posh prompt init pwsh --config ~/.oh-my-posh.omp.json | Invoke-Expression

Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias y yarn
Set-Alias touch New-Item

function yxcv {
    cd ~/Code/Personal

    cd NextJs-Boilerplate
    ncu -u
    yarn

    cd ../Portfolio
    ncu -u
    yarn

    cd ../Portfolio-Test
    ncu -u
    yarn

    cd ../what-do-we-eat
    ncu -u
    yarn

    cd ~/Code
    ncu -g
}

function flb {
    yarn format
    yarn lint
    yarn build
}

function update {
  scoop update
  scoop update neovim
  scoop update fzf
  scoop update neofetch
  
  Update-Module oh-my-posh
  Update-Module PSReadLine

  git update-git-for-windows
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Set-PSReadLineKeyHandler -Chord Ctrl+b -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('flb')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+u -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('yxcv')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

clear
