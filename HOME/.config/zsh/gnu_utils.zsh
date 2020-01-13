# vim:set ft=sh:

# favor GNU utilities provided by homebrew over MacOS versions
gnu_pkgs=(coreutils findutils gnu-sed grep)

for gnu_pkg in ${gnu_pkgs}; do
  if [ -d /usr/local/opt/${gnu_pkg}/libexec/gnubin ]; then
    export PATH="/usr/local/opt/${gnu_pkg}/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/${gnu_pkg}/libexec/gnuman:$MANPATH"
  fi
done

unset gnu_pkgs
