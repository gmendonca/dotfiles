#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

if ! cmd_exists "brew"; then
  print_error " Homebrew is not installed"
  print_info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  print_info "Installing packages..."
  brew install cmake fzf ctags jq fd wget ack neovim
  
  print_info "Installing cask packages..."
  brew cask install iterm2 rectangle
fi

cd ~/workspace/dotfiles/setup/macos/
brew bundle
