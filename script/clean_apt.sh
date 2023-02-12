#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh
msg_info "Enter sudo mode..."
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

msg_info "Clean Apt files..."

apt autoremove
apt autoclean
apt clean
apt -s clean
apt clean all
apt-get clean
apt-get -s clean
apt-get clean all
apt-get autoclean
