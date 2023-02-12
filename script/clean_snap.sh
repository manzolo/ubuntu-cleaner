#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh
msg_info "Enter sudo mode..."
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

msg_info "Remove unused Snaps..."

LANG=it_IT.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
	snap remove "$snapname" --revision="$revision" || true
done
