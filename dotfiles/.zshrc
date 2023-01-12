# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Github GPG
export GPG_TTY=$(tty)

# Google Cloud Platform
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# psql
export PATH="/usr/local/opt/libpq/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$PYENV_ROOT/shims:$PATH"


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
alias sj="export JAVA_HOME=$(jenv prefix)"

alias jn='jupyter notebook'

alias k='kubectl'

export PATH="$HOME/Library/Application Support/Coursier/bin:$PATH"
