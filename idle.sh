#!/bin/bash
echo "Automatic Mode Engaged - killall idle.sh"
while true; do 
	HOUR=`xprintidle`
	./open.sh
        ./build_server_on.sh
	while [ $HOUR -lt "1800000" ]; do 
		sleep 1
		HOUR=`xprintidle`
	done
        ./closed.sh
	./build_server_off.sh
	while [ $HOUR -gt "1800000" ]; do 
                sleep 1
                HOUR=`xprintidle`
        done
done

