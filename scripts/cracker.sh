#!/bin/bash

clear

B='\033[1;34m'
R='\033[1;91m'
G='\033[1;92m'
N='\033[1;37m'

IFS=

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


echo -n -e "${G}Enter path to captured handshake (file ending with .cap): ${N}"
read path

echo
echo

echo -e "${B}1) rockyou wordlist (recomedned)\n2) Small wordlist\n3) Default router credentials${N}"
echo
echo -n -e "${G}Select a worldlist to decrypt the hash: ${N}"
read -n 1 option
echo

	if
		[ "$option" = "1" ];
	then
		sudo aircrack-ng $path -w rockyou.txt
fi

	if
		[ "$option" = "2" ];
	then
		sudo aircrack-ng $path -w small-wordlist.txt
fi

	if
		[ "$option" = "3" ]
	then
		sudo aircrack-ng $path -w default-credentials.txt
fi
