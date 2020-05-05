# Setup

## iterm

Download and install [iTerm2](https://www.iterm2.com/index.html)

* Remember to select unlimited scroll on preferences
* Remember to Allow clipboard access to terminal apps

## oh-my-zsh

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

And add this for key binding:
```
bindkey "[D" backward-word
bindkey "[C" forward-word
```

Install:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${zsh_custom:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Homebrew

Install [Homebrew](https://brew.sh/)

`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## Pre-requisites

```
$ brew install node yarn
$ brew install gpg # Signing commits
$ brew install jenv # Java Management
$ brew install pyenv # python management
$ brew install jq
$ brew install wget
$ brew install ctags
# java versions
$ brew cask install homebrew/cask-versions/zulu8
$ brew cask install homebrew/cask-versions/zulu11

```

## NeoVim

Install NeoVim:

```
$ brew install neovim
```

And run:
```
$ python -m pip install --user --upgrade pynvim
```

## VimPLug

Install [VimPlug](https://github.com/junegunn/vim-plug)

```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

May need to install (`xcode-select --install`)

## Install NeoVim Python Support

```
$ pip3 install neovim --user
```

## init.vim

```
$ mkdir -p ~/.config/nvim
$ cp init.vim ~/.config/nvim
```

Open nvim and type `:PluginInstall`

## fzf

```
$ brew install fzf
$ brew install fd
```

## CoC

```
:CoCInstall coc-python
$ pip install --user jedi
pip install -U python-dotenv
```

Create an `.env` file to the dir you're working on
and add `PYTHONPATH=./scr/to/python/files`.

## Fonts

```
$ git clone https://github.com/powerline/fonts.git
$  cd fonts
$  ./install.sh
```

## Themes for Iterm2 (Optional)

https://github.com/mbadolato/iTerm2-Color-Schemes

Select the color in Profiles > Colors > Color Presets... > Import...

And navigate to iTerm2-Color-Schemes > schemes and selects the ones that you want.

## Keys Setup

Follow this [link](https://apple.stackexchange.com/questions/154292/iterm-going-one-word-backwards-and-forwards/204802#204802)

I also use option d mapped to sequence escape d

## Misc things on `.zshrc`:

```
export EDITOR=nvim

alias n='nvim'
alias nf='nvim $(fzf)'
```

## Screenshots location

```
$ mkdir ~/Pictures/screenshots
$ defaults write com.apple.screencapture location ~/Pictures/screenshots
```

## References

* https://gist.github.com/celso/6cefedb9fce92827ee38e8f7411b8b30
* http://vimcasts.org/episodes/spell-checking/
