#!/bin/bash

clear
IFS= 


R='\033[1;91m'
G='\033[1;92m'
N='\033[1;37m'


echo
echo
echo -e  "${R} \t █     █░ ██▓   ▄▄▄█████▓ ▒█████   ▒█████   ██▓    "
echo -e  " \t▓█░ █ ░█░▓██▒   ▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒    "
echo -e  " \t▒█░ █ ░█ ▒██▒   ▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    "
echo -e  " \t░█░ █ ░█ ░██░   ░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░    "
echo -e  " \t░░██▒██▓ ░██░     ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒"
echo -e  " \t░ ▓░▒ ▒  ░▓       ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░"
echo -e  " \t  ▒ ░ ░   ▒ ░       ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░"
echo -e  " \t  ░   ░   ▒ ░     ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   "
echo -e  " \t    ░     ░                  ░ ░      ░ ░      ░  ░"
echo -e  " \t                                                   ${N}"
echo
echo

sudo airmon-ng check kill && sleep 2

echo -n -e "${G}Enter the name of the wifi interface (press enter to select wlan0): ${N}"
	if
			read -n 1 key
			[ "$key" = "" ];

	then
		sudo airmon-ng start wlan0 && sleep 2s
	else
		read interface
		sudo airmon-ng start $key$interface
fi
echo
echo -n -e "${G}Enter the duration in seconds to scan for nearby networks (Enter to select deafult 10s): ${N}"
read -n 1 timer

	if
			[ "$timer" = "" ]
		then

			if
				[ "$key" =  "" ];
			then
				sudo timeout 10 airodump-ng wlan0
			else
				sudo timeout 10 airodump-ng $key$interface
			fi
		else
			read timer1
				if
					[ "$key" = "" ]
				then
					sudo timeout $timer$timer1 wlan0
				else
					sudo timeout $timer$timer1 $key$interface
				fi
fi
echo
echo

echo -n -e "${G}Enter the BSSID of the target: ${N}" 
read bssid

echo

echo -n -e "${G}Enter the channel of the target: ${N}" 
read channel

clear

echo

echo -n -e "${G}Enter the directory to save the files: ${N}" 
read directory

echo

echo -n -e "${G}Enter the wifi interface in ${R}monitor mode${N} (press enter to select wlan0): ${N}"

read -n 1 key1

		if
				[ "$key1" = "" ]
			then
				sudo airodump-ng --bssid $bssid -c $channel --write $directory wlan0
			else
				read interfacemon
				sudo airodump-ng --bssid $bssid -c $channel --write $directory $key1$interfacemon
fi
