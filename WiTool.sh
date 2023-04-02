#!/bin/bash

R='\033[1;91m'
G='\033[1;92m'
N='\033[1;37m'

IFS=

clear

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


echo -n -e "${G}1) Capture handshake\n2) Deauthenticate Network\n3) Crack captured handshake${N}"
echo
echo
echo -n "Select an option to continue: "
read -n 1 input

	if
			[ "$input" = "1" ]
		then
			sudo bash scripts/handshake.sh
fi
	if
			[ "$input" = "2" ]
		then
			sudo bash scripts/deauther.sh
fi

	if
			[ "$input" = "3" ]
		then
			sudo bash scripts/cracker.sh
fi
