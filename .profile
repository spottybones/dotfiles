# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Load shell dotfiles
for file in ~/.{bash_prompt,exports}; do
    [ -r "$file" ] && source "$file"
done
unset file

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# if [ -d "$HOME/.gem/ruby/1.8/bin" ] ; then
#     PATH="$HOME/.gem/ruby/1.8/bin:$PATH"
# fi

# # add the Android SDK tool paths of they exist
# ANDROID_SDK="$HOME/Tools/android-sdk-macosx"
# if [ -d "$ANDROID_SDK/tools" ] ; then
#     PATH="$ANDROID_SDK/tools:$PATH"
# fi
# if [ -d "$ANDROID_SDK/platform-tools" ] ; then
#     PATH="$ANDROID_SDK/platform-tools:$PATH"
# fi

# add MacPorts command paths, if they exist
# if [ -d "/opt/local/sbin" ] ; then
#     PATH="/opt/local/sbin:$PATH"
# fi
# if [ -d "/opt/local/bin" ] ; then
#     PATH="/opt/local/bin:$PATH"
# fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
