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
read -p "Enter target Domain:" DOM
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with assetfinder scan\e[0m"
assetfinder --subs-only $DOM -v > /home/parrot/Desktop/all.txt
echo -e "\e[5mDiscovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mstarting with Findomain scan\e[0m"
findomain -t $DOM > /home/parrot/Desktop/all.txt
echo -e "\e[5mFindomain discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with subfinder scan\e[0m"
subfinder -d $DOM > /home/parrot/Desktop/all.txt
echo
echo -e "\e[5mSubfinder discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
echo
echo -e "\e[36mStarting with amass scan\e[0m"
amass enum -d $DOM > /home/parrot/Desktop/all.txt
echo -e "\e[5mamass discovery saved to all.txt\e[0m"
echo
echo "--------------------------------------------------"
