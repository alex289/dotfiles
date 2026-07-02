oh-my-posh init pwsh --config ~/.oh-my-posh.omp.json | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSFzf

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-Alias v nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias p pnpm
Set-Alias c code
Set-Alias touch New-Item
Set-Alias .. GoUp

function vs {
    $solutionFile = (Get-ChildItem -Path .\ -Filter *.sln -File | ForEach-Object { $_.Name })
    devenv $solutionFile
}

function update {
    scoop update
    scoop update neovim
    scoop update fzf
    scoop update pnpm

    git update-git-for-windows
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function merge {
    param(
        [string]$branchName = "main"
    )

    $latestBranch = git rev-parse --abbrev-ref HEAD

    git checkout $branchName
    git pull

    git checkout $latestBranch
    git merge $branchName
}

Set-PSReadLineKeyHandler -Chord Ctrl+q -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('exit')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function GoUp {
    Set-Location ..
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

clear
