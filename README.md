# Setup

Start by running `xcode-select --install` in the default terminal and following instructions.

Then follow [instructions](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to create a SSH Key and add to Github.

Copy `setup/.env.var.example` to `setup/.env.var` and adapt it accordingly.

Then:

```sh
$ mkdir ~/workspace && git clone git@github.com:gmendonca/dotfiles.git && make macos
```

## iTerm

* Go to Preferences > Profiles > Terminal and toggle `Unlimited scroll`
* Go to General > Selection and toggle `Applications in terminal may access clipboard`
* Go to Preferences > Profiles > Text > Font and change to `Meslo LG L for Powerline`
* Go to Preferences > Profiles > Keys and add:
1. Move one word forward
```
option+right
send escape sequence
f
```
1. Move one word backward
```
option+left
send escape sequence
b
```
1. Delete one word forward
```
option+d
send escape sequence
d
```

## NeoVim

Open nvim and type `:PluginInstall`

### CoC

```
:CoCInstall coc-python
$ pip install --user jedi
pip install -U python-dotenv
```

Create an `.env` file to the dir you're working on
and add `PYTHONPATH=./scr/to/python/files`.

* Select the color in Profiles > Colors > Color Presets... > Import...
> iTerm2-Color-Schemes > schemes > Gruvbox Dark

## Screenshots location

```
$ mkdir ~/Pictures/screenshots
$ defaults write com.apple.screencapture location ~/Pictures/screenshots
```
