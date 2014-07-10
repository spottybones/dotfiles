# vim:set ft=sh:

set -o vi

# determine local IP addresses
function localip() {
    for IF in en{0,1,2,3,4}; do
        local IP=$(ipconfig getifaddr ${IF})
        if ! test -z "${IP}"
        then
            echo $IF: $IP
        fi
    done
}
