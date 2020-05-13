# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8

# Github GPG
export GPG_TTY=$(tty)

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# neovim and fzf
export EDITOR=nvim

alias n='nvim'
alias nf='nvim $(fzf)'
alias nfh='nvim $(fd --type f --hidden -E .git | fzf)'
alias f='fzf'
alias c='cd $(fd --type d | fzf)'
alias ni='n ~/.config/nvim/init.vim'
alias nz='n ~/.zshrc'

export FZF_DEFAULT_COMMAND='fd --type f'

alias sz='source ~/.zshrc'
