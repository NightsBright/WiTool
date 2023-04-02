#!/bin/bash

G='\033[1;92m'

clear

wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

mv rockyou.txt scripts

echo
echo -n -e "${G}set up completed"
