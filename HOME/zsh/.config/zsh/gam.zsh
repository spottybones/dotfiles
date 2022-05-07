# The git plugin, if enabled, aliases "gam" to "git am". If the plugin/alias is
# enabled, disable it to prevent conflict with Google Admin Manager "gam".
[[ -n $(alias gam) ]] && unalias gam

[[ -d "${HOME}/Applications/gam" ]] && export PATH="${HOME}/Applications/gam:${PATH}"
