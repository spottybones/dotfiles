# if Poetry's bin exists, add it to the PATH
if [[ -d "${HOME}/.poetry/bin" ]]; then
    export PATH="${HOME}/.poetry/bin:${PATH}"
fi

# create poetry virtual envs in project
export POETRY_VIRTUALENVS_IN_PROJECT=1
