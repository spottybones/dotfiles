# vim:set ft=sh:

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"
alias o="open"
alias oo="open ."

# base directory listing
alias l="ls"
alias ll='ls -l'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# Get week number
alias week='date +%V'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# IP addresses
alias ip='echo $(curl -s https://diagnostic.opendns.com/myip)'
# alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# URL-encode strings
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote(sys.argv[1]));"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
# alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
# alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Print a string with current date and time
alias now="date +'%Y%m%d%H%M'"

# Always enable colored `grep` output
alias grep="grep --color=auto"

# Reset TERM when using SSH to connect to other hosts. Necessary because
# we use a custom $TERM locally.
alias ssh="TERM=xterm-256color ssh "
alias mp="TERM=xterm-256color multipass "

# Aliases for Linux to match command names used on Darwin
[[ "$(uname -s)" = "Linux" ]] && {
    alias bat='batcat '
    alias nvim='vim '
}
