#!/bin/bash
DATE=$(date)
echo $DATE
LOG_FILE=$PWD/beef.log
exec > >(tee -a ${LOG_FILE} )
exec 2> >(tee -a ${LOG_FILE} >&2)
echo $DATE > $PWD/beef.log
echo "[*]Starting the BeEF Framework and Panel..."
echo "[*]Go to http://10.0.0.1:3000/ui/panel for control BeEF"
echo "[*]More infos will appear right now..."
echo "[*]Login is:"
echo "[!]User: RogueSploit"
echo "[!]Password: pwnonair"
cd /usr/share/beef-xss/ && sudo ruby beef

