#!/bin/bash

echo "________________________________________________"
echo -e "\e[33m
                  __   ___  ___  ___
   |\  /| |  |   |  | |    |    |   | |\   |
   | \/ | |__|   |__| |__  |    |   | | \  |
   |    |    |   |\   |    |    |   | |  \ | 
   |    |  __|   | \  |___ |___ |___| |   \| 
\e[0m
"
echo "________________________________________________"
echo
echo
echo
echo -e "\e[5;31mAlert!!! this will delete all previously collected domains from all.txt\e[0m"
read -p "Enter target Domain:" DOM
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with Assetfinder scan\e[0m"
assetfinder --subs-only $DOM -v > /home/parrot/Desktop/all.txt
echo -e "\e[5mDiscovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mstarting with Findomain scan\e[0m"
findomain -q -t $DOM >> /home/parrot/Desktop/all.txt
echo -e "\e[5mFindomain discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with Subfinder scan\e[0m"
subfinder -d $DOM >> /home/parrot/Desktop/all.txt
echo
echo -e "\e[5mSubfinder discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with Amass scan\e[0m"
amass enum -d $DOM >> /home/parrot/Desktop/all.txt
echo -e "\e[5mamass discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo -e "\e[31m_________________________________________\e[0m"
echo
echo
echo -e "\e[5;33m SUBDOMAIN DISCOVERY COMPLETED\e[0m"
echo
echo
echo -e "\e[31m_________________________________________\e[0m"
echo "."
echo "."
echo "NOW SORTING DISCOVERED ASSETS"
echo "."
echo "."
cat /home/parrot/Desktop/all.txt | sort -u > /home/parrot/Desktop/sort.txt
echo -e "\e[5;33mSORTING COMPLETED\e[0m"
echo "."
echo "."
echo "CHECKING FOR ACTIVE DOMAINS"
echo 
cat /home/parrot/Desktop/sort.txt | httpx --status-code > /home/parrot/Desktop/active.txt
echo
echo
echo
cat /home/parrot/Desktop/active.txt
echo
echo
echo -e "\e[34;5m
 ___    ___          ___
|   \  |   | |\   | |
|    | |   | | \  | |__
|    | |   | |  \ | |
|___/  |___| |   \| |___
\e[0m"

echo -e "\e[5;33mStarting Directory Scanning using dirsearch\e[0m"
echo
echo
./directory.sh
export DOM
./discord.sh
echo 
echo
