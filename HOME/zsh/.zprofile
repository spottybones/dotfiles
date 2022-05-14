if [[ -z "${PATH_SET}" ]]; then

    # set starting command paths
    export PATH="${HOME}/.local/bin:${PATH}"

    # Homebrew paths
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # If installed, initialize path for `pyenv` here
    if command -v pyenv > /dev/null 2>&1; then
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"
    fi

    export PATH_SET="${PATH_SET}true"
fi
