# vim:set ft=sh:

# Make vim the default editor
export EDITOR="vim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extendedglob
# Make some commands not show up in history
export HISTORY_IGNORE='(ls|cd|cd -|-|pwd|exit|date|* --help|l|ll|lT|op *)?'
zshaddhistory() {
  emulate -L zsh
  [[ ${1} != ${~HISTORY_IGNORE} ]]
}

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# if "bat" is installed use it for displaying man pages
if [[ ${+commands[bat]} ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
else
  export MANPAGER="less -X"
fi

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# set location of IPython configuration per XDG spec
[ -d "${XDG_CONFIG_HOME}/ipython" ] && export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

# set location of Jupyter configuration per XDG spec
[ -d "${XDG_DATA_HOME}/jupyter" ] && export JUPYTER_PATH="${XDG_DATA_HOME}/jupyter"
[ -d "${XDG_CONFIG_HOME}/jupyter" ] && export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"

[ -f "$HOME/.config/pip/pip.conf" ] && export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"

[ -f "$HOME/.boto" ] && export BOTO_CONFIG="$HOME/.boto"

# set GPG_TTY for gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
