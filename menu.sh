#! /bin/bash
clear

. $(dirname $0)/script/__functions.sh 
. $(dirname $0)/include/__wait.sh

while [ 1 ]
do
CHOICE=$(
whiptail --title "Ubuntu cleaner" \
					  --ok-button "Select" \
                      --nocancel \
					  --menu "Make your choice" 0 0 0 \
	"1)" "Clean unused snap"   \
	"2)" "Clean unused kernel"   \
	"3)" "Clean Apt files"   \
	"4)" "Clean docker"   \
	"5)" "Clean old files"   \
	"8)" "Clean Yarn cache files"   \
	"9)" "Clean Php composer cache files"   \
	"Q)" "Exit"  3>&2 2>&1 1>&3	
)
case $CHOICE in
    "1)")
		$(dirname $0)/script/clean_snap.sh
		do_waitkey
    ;;
    "2)")
		$(dirname $0)/script/clean_kernel.sh
		do_waitkey
    ;;
    "3)")
		$(dirname $0)/script/clean_apt.sh
		do_waitkey
    ;;
    "4)")
		$(dirname $0)/script/clean_docker.sh
		do_waitkey
    ;;
    "5)")
		$(dirname $0)/script/clean_old_files.sh
		do_waitkey
    ;;
    "8)")
		$(dirname $0)/script/clean_yarn.sh
		do_waitkey
    ;;
    "9)")
		$(dirname $0)/script/clean_php_composer.sh
		do_waitkey
    ;;

	"Q)")   
		exit
	;;
esac
done
