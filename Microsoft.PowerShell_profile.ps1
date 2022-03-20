Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme  ~/.oh-my-posh.omp.json

Import-Module Terminal-Icons

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias y yarn

function Matrix {
    Import-Module ~\cmatrix
    Set-ScreenSaverTimeout -Seconds 5
    Enable-ScreenSaver
}

function yxcv([switch]$verify = $false, [switch]$commit = $false) {
    cd ~/Code/Personal

    cd NextJs-Boilerplate
    ncu -u
    yarn
    if($verify) {
        flb
    }

    cd ../Portfolio
    ncu -u
    yarn
    if($verify) {
        flb
    }
    if($commit) {
        git add .
        git commit -m"Update deps"
        git push
    }

    cd ../Portfolio-Test
    ncu -u
    yarn
    if($commit) {
        git add .
        git commit -m"Update deps"
        git push
    }

    cd ../what-do-we-eat
    ncu -u
    yarn
    if($verify) {
        flb
    }
    if($commit) {
        git add .
        git commit -m"Update deps"
        git push
    }

    cd ~/Code
    ncu -g
}

function flb {
    yarn format
    yarn lint
    yarn build
}

clear
