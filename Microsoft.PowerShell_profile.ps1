oh-my-posh init pwsh --config ~/.oh-my-posh.omp.json | Invoke-Expression

Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-Alias v nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias y yarn
Set-Alias p pnpm
Set-Alias c code
Set-Alias touch New-Item

function vs {
    $solutionFile = (Get-ChildItem -Path .\ -Filter *.sln -File | ForEach-Object { $_.Name })
    devenv $solutionFile
}

function flb {
    pnpm format
    pnpm lint
    pnpm build
}

function update {
    scoop update
    scoop update oh-my-posh
    scoop update neovim
    scoop update fzf
    scoop update neofetch
    scoop update nvm
    scoop update pnpm

    Update-Module PSReadLine

    git update-git-for-windows
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function transfer ($file) {
    curl -H "Max-Downloads: 1" -H "Max-Days: 5" --upload-file $file https://transfer.sh/$file
}

Set-PSReadLineKeyHandler -Chord Ctrl+b -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('flb')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+q -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

clear
