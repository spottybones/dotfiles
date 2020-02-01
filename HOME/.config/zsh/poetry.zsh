# if Poetry's bin exists, add it to the PATH
if [[ -d "${HOME}/.poetry/bin" ]]; then
    export PATH="${HOME}/.poetry/bin:${PATH}"
fi
