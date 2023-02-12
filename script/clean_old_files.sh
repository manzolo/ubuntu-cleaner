#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh
msg_info "Enter sudo mode..."
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "Remove temp files..."
find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'

echo "Remove cache files..."
find ~/.cache/ -type f -atime +365 -delete

echo "Remove old logs..."
sudo rm -f /var/log/*gz

echo "Remove thumbnails..."
rm -rf ~/.cache/thumbnails/*