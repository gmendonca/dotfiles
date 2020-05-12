#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

if [[ $(gpg --list-secret-keys --keyid-format LONG) ]]; then
  print_info "Key Found"
  gpg --armor --export "$(gpg --list-secret-keys --keyid-format LONG | awk 'FNR==3{print $2}' | cut -d/ -f2)" | pbcopy
else
  print_info "No Key Found. Creating One"
  gpg --full-generate-key
fi


git config --global commit.gpgsign true
git config --global user.signingkey $(gpg --list-secret-keys --keyid-format LONG | awk 'FNR==3{print $2}' | cut -d/ -f2)
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global core.excludesfile ~/workspace/.gitignore
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
