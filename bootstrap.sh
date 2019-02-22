#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")" || (echo "Unable to switch to script directory" && exit 1)

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# git pull origin ccpcs000536
function doIt() {
  # rsync contents of HOME to $HOME
  rsync -av ./HOME/ ~/
  # ensure VIM temp directories exist
  mkdir -p "${XDG_DATA_HOME}"/vim/{backups,swaps,undo}
  # ensure IPython/Jupyter temp directories exist
  mkdir -p "${XDG_DATA_HOME}"/{ipython,jupyter}
  # install xterm-256color-italic TERM entry
  tic ./external_configs/xterm-256color-italic.terminfo
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
  doIt
else
  read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
