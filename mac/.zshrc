# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias g="git"
alias v="nvim"
alias p="pnpm"
alias y="yarn"
alias c="code ."
alias ll="exa --icons --long -a --group-directories-first --git"
alias flb="p format && p lint && p build"
alias tm="tmux"
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; "
alias ..="cd .."
alias zshrc="code ~/.zshrc"
alias ip="ipconfig getifaddr en0"
alias externIp="curl ifconfig.me"
alias tiling-start="yabai --start-service && skhd --start-service"
alias tiling-stop="yabai --stop-service && skhd --stop-service"
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

export GPG_TTY=$(tty)

eval "$(zoxide init zsh)"

eval "$(github-copilot-cli alias -- "$0")"

# bun completions
[ -s "/Users/alex/.bun/_bun" ] && source "/Users/alex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
