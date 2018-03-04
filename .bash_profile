# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.bash_{path,prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# The next line updates PATH for the Google Cloud SDK.
[ -f $HOME/Applications/google-cloud-sdk/path.bash.inc ] && source "$HOME/Applications/google-cloud-sdk/path.bash.inc"

# The next line enables shell command completion for gcloud.
[ -f $HOME/Applications/google-cloud-sdk/completion.bash.inc ] && source "$HOME/Applications/google-cloud-sdk/completion.bash.inc"

# start up ssh-agent if not in TMUX
if [ -z "$TMUX" ]; then
  # we're not in a TMUX session

  if [ ! -z "$SSH_TTY" ]; then
    # logged in via SSH

    # if the SSH_AUTH_SOCK variable is missing create it
    [ -z "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"

    # create the auth socket if it doesn't exist
    if [ ! -S "$SSH_AUTH_SOCK" ]; then
      eval $(ssh-agent -a "$SSH_AUTH_SOCK")
      echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
    fi

    # if agent isn't defined recreate it from the pid file
    [ -z "$SSH_AGENT_PID" ] && export SSH_AGENT_PID=$(cat $HOME/.ssh/.auth_pid)

    # add default keys to ssh auth
    ssh-add 2>/dev/null

    # start or attach to tmux default session
    tmux attach -t default || tmux new -s default
  fi
fi
