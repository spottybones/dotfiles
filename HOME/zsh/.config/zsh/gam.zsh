# The git plugin, if enabled, aliases "gam" to "git am". If the plugin/alias is
# enabled, disable it to prevent conflict with Google Admin Manager "gam".

if [[ -d "${GAM_HOME}" ]]; then
    [[ -n $(alias gam) ]] && unalias gam
    export PATH="${GAM_HOME}:${PATH}"
fi
