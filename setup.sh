#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./setup/utils.sh" \
    && . "./setup/.env.var"

java() {
  JENV_PATH=~/.jenv/versions/
  mkdir -p $JENV_PATH
  if [ ! -d "$JENV_PATH/8" ]; then
    ln -fs /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home $JENV_PATH/8
  fi
  if [ ! -d "$JENV_PATH/11" ]; then
    ln -fs /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home $JENV_PATH/11
  fi
}

python() {
  packages=( pynvim neovim pylint jedi tox tox-venv black flake8 notebook )
  for i in "${packages[@]}"
  do
    if ! $(pip3 list --disable-pip-version-check | grep $i &> /dev/null) ; then 
      print_info "Installing $i"
      pip3 install $i --user
    fi
  done
}


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
java
python
