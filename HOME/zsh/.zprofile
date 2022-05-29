if [[ -z "${PATH_SET}" ]]; then

    # set starting command paths
    export PATH="${HOME}/.local/bin:${PATH}"

    case "$(uname -s)-$(arch)" in

        Darwin-i386)
            eval "$(/usr/local/bin/brew shellenv)"
            export PYENV_ROOT="$HOME/.pyenv-i386"
            ;;

        Darwin-arm64)
            eval "$(/opt/homebrew/bin/brew shellenv)"
            export PYENV_ROOT="$HOME/.pyenv"
            ;;

        *)
            export PYENV_ROOT="$HOME/.pyenv"
            ;;

    esac

    # If installed, initialize path for `pyenv` here
    if [[ -d "$PYENV_ROOT" ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"
    fi

    export PATH_SET="${PATH_SET}true"
fi
