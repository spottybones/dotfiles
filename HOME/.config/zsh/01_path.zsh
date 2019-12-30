# vim:set ft=sh:

# Default to Homebrew Python 3 on macOS, if installed
[ -d /usr/local/opt/python/libexec/bin ] && export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# if Python3 is installed add it's --user-base/bin directory to our PATH
[ -n "$(which python3)" ] && export PATH="$(python3 -m site --user-base)/bin:$PATH"

[ -d "/usr/local/heroku/bin" ] && export PATH="/usr/local/heroku/bin:$PATH"
[ -d "$HOME/Applications/instantclient_12_1" ] && export PATH="$HOME/Applications/instantclient_12_1:$PATH"
[ -d "$HOME/opt/conda/bin" ] && export PATH="$HOME/opt/conda/bin:$PATH"

# Homebrew's sbin
[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"

# add path to GAM
[ -x "$HOME/Applications/gam/gam" ] && export PATH="$HOME/Applications/gam:$PATH"
