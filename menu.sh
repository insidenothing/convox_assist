#!/bin/bash
# Purpose: Display various options to operator using menus
# Author: Vivek Gite < vivek @ nixcraft . com > under GPL v2.0+
# ---------------------------------------------------------------------------
# capture CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
 
# display message and pause 
pause(){
	local m="$@"
	echo "$m"
	read -p "Press [Enter] key to continue..." key
}
 
# set an 
while :
do
	# show menu
	clear
	echo "---------------------------------"
	echo "	     M A I N - M E N U"
	echo "---------------------------------"
	echo "1. Show current date/time"
	echo "2. Automatic Mode"
	echo "3. Build Box On"
	echo "4. Build Box Off"
	echo "5. Exit"
	echo "---------------------------------"
	read -r -p "Enter your choice [1-5] : " c
	# take action
	case $c in
		1) pause "$(date)";;
		2) ./idle.sh;;
		3) ./open.sh; ./build_server_on.sh;;
		4) ./closed.sh; ./build_server_off.sh;;
		5) break;;
		*) Pause "Select between 1 to 5 only"
	esac
done
