#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./setup/utils.sh" \
    && . "./setup/.env.var"

python() {
  # Install a modern Python via pyenv and set it as global
  PYTHON_VERSION=$(pyenv install --list | grep -E '^\s+3\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
  pyenv install --skip-existing "$PYTHON_VERSION"
  pyenv global "$PYTHON_VERSION"

  packages=( pynvim pylint black flake8 notebook )
  for i in "${packages[@]}"
  do
    if ! $(pip list --disable-pip-version-check | grep $i &> /dev/null) ; then
      print_info "Installing $i"
      pip install $i
    fi
  done
}


main() {

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
  if [ ! -f "$PLUGVIM" ]; then
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
python

# Claude Code
if ! cmd_exists "claude"; then
  print_info "Installing Claude Code"
  npm install -g @anthropic-ai/claude-code
fi
