#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./setup/utils.sh" \
    && . "./setup/.env.var"

main() {

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  FONTS=~/workspace/fonts
  if [ ! -d "$FONTS" ]; then
    git clone https://github.com/powerline/fonts.git --depth=1 $FONTS
    (cd $FONTS ; ./install.sh)
  fi

  COLORSCHEMES=~/workspace/iTerm2-Color-Schemes
  if [ ! -d "$COLORSCHEMES" ]; then
    git clone https://github.com/mbadolato/iTerm2-Color-Schemes $COLORSCHEMES
  fi

  PLUGVIM=~/.local/share/nvim/site/autoload/plug.vim
  if [ ! -d "$PLUGVIM" ]; then
    curl -fLo $PLUGVIM --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  if [[ $(python3 -c "import pynvim" &> /dev/null) ]]; then 
    pip3 install pynvim --user
  fi

  if [[ $(python3 -c "import pynvim" &> /dev/null) ]]; then 
    pip3 install neovim --user
  fi

  mkdir -p ~/Pictures/screenshots
  defaults write com.apple.screencapture location ~/Pictures/screenshots

  ln -fs ~/workspace/dotfiles/nvim ~/.config
  ln -fs ~/workspace/dotfiles/dotfiles/.zshrc ~/.zshrc
  ln -fs ~/workspace/dotfiles/dotfiles/.gitignore ~/.gitignore
  ln -fs ~/workspace/dotfiles/dotfiles/.ackrc ~/.ackrc
}

cd "$(dirname "${BASH_SOURCE[0]}")"
sh "./setup/macos/brew.sh"
sh "./setup/macos/git.sh"
main
