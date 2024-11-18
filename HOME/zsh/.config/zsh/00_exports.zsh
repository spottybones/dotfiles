# vim:set ft=sh:

# Make vim the default editor
export EDITOR="vim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# set location of IPython configuration per XDG spec
[ -d "${XDG_CONFIG_HOME}/ipython" ] && export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

# set location of Jupyter configuration per XDG spec
[ -d "${XDG_DATA_HOME}/jupyter" ] && export JUPYTER_PATH="${XDG_DATA_HOME}/jupyter"
[ -d "${XDG_CONFIG_HOME}/jupyter" ] && export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"

[ -f "$HOME/.config/pip/pip.conf" ] && export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

[ -f "$HOME/.boto" ] && export BOTO_CONFIG="$HOME/.boto"

# set GPG_TTY for gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

my-jupyter-notebook () {
    docker run --rm \
    --name jupyter-notebook \
    -v $(pwd):/home/jovyan \
    -v $HOME/.jupyter:/home/jovyan/.jupyter \
    -v $HOME/.ipython:/home/jovyan/.ipython \
    -p 8888:8888 \
    jupyter/datascience-notebook start-notebook.sh
}

my-ipython () {
    docker run --rm \
    -it \
    --name ipython \
    -v $(pwd):/home/jovyan/work \
    -v $HOME/.ipython:/home/jovyan/.ipython \
    jupyter/datascience-notebook start.sh ipython $@
}
