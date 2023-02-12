#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh
msg_info "Enter sudo mode..."
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

msg_info "Remove unused Snaps..."
docker system prune -f
