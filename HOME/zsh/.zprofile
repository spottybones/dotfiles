# set starting command paths
export PATH="${HOME}/.local/bin:${PATH}"

# set up Homebrew path if we're running under Darwin
case "$(uname -s)-$(arch)" in
    Darwin-i386)
        eval "$(/usr/local/bin/brew shellenv)"
        ;;
    Darwin-arm64)
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ;;
esac
