# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add dev directory
mkdir ~/dev

# Install some packages
brew install git node neovim bat exa gnupg pinentry-mac ripgrep wget tmux zoxide neofetch k9s atuin lazygit yazi ffmpegthumbnailer unar jq poppler fd fzf tokei

brew install --cask visual-studio-code google-chrome notion spotify rectangle alt-tab devtoys stats raycast iterm2 arc fig

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup neovim config
git clone https://github.com/alex289/astronvim_config.git ~/.config/nvim/lua/user

# Install node packages
npm install -g npm-check-updates prettier eslint serve typescript yarn pnpm case-police