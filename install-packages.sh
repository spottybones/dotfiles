#!/usr/bin/env bash
# (@) install standard packages using Homebrew (https://brew.sh)
#     and pipx (https://github.com/pypa/pipx)

# my necessary utilties
brew install stow
brew install tmux
brew install coreutils
brew install gsed
brew install nvim
brew install pipx
brew install pyenv
brew install pipenv
brew install bat
brew install git-delta
brew install fzf
brew install ripgrep
brew install fd
brew install google-cloud-sdk
brew install sf-pwgen

# application software in casks
brew install --cask moom
brew install --cask 1password
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask bbedit

# nerdfonts and symbols for iTterm
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-meslo-for-powerline

# Python apps
pipx install powerline-status
pipx install pre-commit
