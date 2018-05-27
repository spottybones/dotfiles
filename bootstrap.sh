#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
# git pull origin ccpcs000536
function doIt() {
  # symlink managed .dotfiles to the home directory
  for DOTFILE in .{vim,gvim}rc .vim .dircolors .tmux.conf .gitconfig; do
    [ -f "$(pwd)/$DOTFILE" ] && ln -sTi $(pwd)/${DOTFILE} ~/${DOTFILE}
  done

  # copy bash configuration
  for DOTFILE in .bash{rc,_profile,_logout}; do
    [ -f ~/${DOTFILE} ] && rm ~/${DOTFILE}
    cp ${DOTFILE} ~/${DOTFILE}
  done
  rsync -av ./.config ~/

##  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    ##--exclude ".vim" --exclude ".vimrc" --exclude ".gvimrc" \
    ##--exclude ".gitignore" \
    ##--exclude ".gitmodules" --exclude "README.md" \
    ##--exclude "LICENSE-MIT.txt" -av --no-perms . ~
  # source ~/.bash_profile
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
