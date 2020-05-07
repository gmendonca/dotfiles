#!/bin/bash

main() {
  xcode-select --install
  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


  mkdir ~/workspace
  git clone https://github.com/powerline/fonts.git --depth=1 -C ~/workspace
  (cd ~/workspace/fonts ; ./install.sh)

}

cd "$(dirname "${BASH_SOURCE[0]}")"
sh "./setup/macos/brew.sh"

