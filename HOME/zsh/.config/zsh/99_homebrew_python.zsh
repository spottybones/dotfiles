# :vim:ft=bash:

# If python has been installed with homebrew use its newest version
# as the default
if [[ -n "$(command -v brew)" ]]; then

  LATEST_HOMEBREW_PYTHON="$(brew list | grep '^python@' | sort -V | tail -1)"

  if [[ -n "${LATEST_HOMEBREW_PYTHON}" ]]; then

    export PATH="$(brew --prefix ${LATEST_HOMEBREW_PYTHON})/bin:$PATH"
    export PATH="$(brew --prefix ${LATEST_HOMEBREW_PYTHON})/libexec/bin:$PATH"

  fi

  unset LATEST_HOMEBREW_PYTHON

fi
