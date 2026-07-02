if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(zoxide init zsh)"
eval "$(atuin init zsh  --disable-up-arrow  --disable-ctrl-r)"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/zen.toml)"
fi

export PATH="$HOME/go/bin:$PATH"

alias v="nvim"
alias p="pnpm"
alias y="yarn"
alias c="code ."
alias ll="eza --icons --long -a --group-directories-first --git"
alias flb="p format && p lint && p build"
alias tm="tmux"
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; "
alias ..="cd .."
alias zshrc="code ~/.zshrc"
alias ip="ipconfig getifaddr en0"
alias externIp="curl ifconfig.me"
alias start="open"
alias search="find . -type f -not -path './.git/*' -not -path './node_modules/*' | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

# Git Aliases
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias gb='git branch'
alias gbd='git branch -d'
alias gba='git branch -a'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gps='git push'
alias gpu='git push -u origin HEAD'
alias gpf='git push --force'
alias gr='git remote -v'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias gra='git remote add'
alias grs='git remote show'
alias gri='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsl='git stash list'

eval "$(fzf --zsh)"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

export GPG_TTY=$(tty)

function merge {
    local branchName=${1:-"main"}
    local latestBranch=$(git rev-parse --abbrev-ref HEAD)

    git checkout "$branchName"
    git pull

    git checkout "$latestBranch"
    git merge "$branchName"
}

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/alex/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
