if [[ -z "${PATH_SET}" ]]; then
	# set starting command paths
	export PATH="${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:${PATH}"

	# Initialize path for pyenv here
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"

	export PATH_SET="${PATH_SET}true"
fi
