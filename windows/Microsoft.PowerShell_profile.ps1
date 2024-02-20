oh-my-posh init pwsh --config ~/.oh-my-posh.omp.json | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSFzf

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
Set-Alias .. GoUp

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
    scoop update neovim
    scoop update fzf
    scoop update pnpm

    git update-git-for-windows
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function transfer ($file) {
    curl -H "Max-Downloads: 1" -H "Max-Days: 5" --upload-file $file https://transfer.sh/$file
}

function merge {
    param(
        [string]$branchName = "develop"
    )

    $latestBranch = git rev-parse --abbrev-ref HEAD

    git checkout $branchName
    git pull

    git checkout $latestBranch
    git merge $branchName
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

function ?? {
    $TmpFile = New-TemporaryFile
    github-copilot-cli what-the-shell ('use powershell to ' + $args) --shellout $TmpFile
    if ([System.IO.File]::Exists($TmpFile)) {
        $TmpFileContents = Get-Content $TmpFile
            if ($TmpFileContents -ne $nill) {
            Invoke-Expression $TmpFileContents
            Remove-Item $TmpFile
        }
    }
}

function git? {
    $TmpFile = New-TemporaryFile
    github-copilot-cli git-assist $args --shellout $TmpFile
    if ([System.IO.File]::Exists($TmpFile)) {
        $TmpFileContents = Get-Content $TmpFile
            if ($TmpFileContents -ne $nill) {
            Invoke-Expression $TmpFileContents
            Remove-Item $TmpFile
        }
    }
}
function gh? {
    $TmpFile = New-TemporaryFile
    github-copilot-cli gh-assist $args --shellout $TmpFile
    if ([System.IO.File]::Exists($TmpFile)) {
        $TmpFileContents = Get-Content $TmpFile
            if ($TmpFileContents -ne $nill) {
            Invoke-Expression $TmpFileContents
            Remove-Item $TmpFile
        }
    }
}

function GoUp {
    Set-Location ..
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

clear
