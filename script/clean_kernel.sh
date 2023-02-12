#! /bin/bash
. $(dirname $BASH_SOURCE)/__functions.sh
msg_info "Enter sudo mode..."
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

msg_info "Remove old kernel..."
apt-get -y purge $(dpkg-query -W -f'${Package}\n' 'linux-*' | sed -nr 's/.*-([0-9]+(\.[0-9]+){2}-[^-]+).*/\1 &/p' | linux-version sort | awk '($1==c){exit} {print $2}' c=$(uname -r | cut -f1,2 -d-))
dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs sudo apt-get -y purge
