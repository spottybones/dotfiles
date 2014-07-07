#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
# git pull origin master
function doIt() {
  # symlink managed .dotfiles to the home directory
  for DOTFILE in .vimrc .gvimrc .vim .bash_aliases; do
    ln -sTi $(pwd)/${DOTFILE} ~/${DOTFILE}
  done
##  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    ##--exclude ".vim" --exclude ".vimrc" --exclude ".gvimrc" \
    ##--exclude ".gitignore" \
    ##--exclude ".gitmodules" --exclude "README.md" \
    ##--exclude "LICENSE-MIT.txt" -av --no-perms . ~
##  source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
