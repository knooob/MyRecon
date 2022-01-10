#!/bin/bash

echo "________________________________________________"
echo -e "\e[33m
                 ___   
   |\  /| |  |  |   \  
   | \/ | |__|  |    |
   |    |    |  |    | 
   |    |  __|  |___/ 
\e[0m
"
echo "________________________________________________"
echo
read -p "Enter throttling value(Normal is 30):" THR
echo
echo
python3 /home/parrot/tools/dirsearch/dirsearch.py --url-list=/home/parrot/Desktop/assetdata/forward.txt -t $THR
#for links in $(cat /home/parrot/Desktop/forward.txt);do
#    (python3 /home/parrot/tools/dirsearch/dirsearch.py -u $links)
#done
#./discord.sh
echo -e "\e[34;5m
 ___    ___          ___
|   \  |   | |\   | |
|    | |   | | \  | |__
|    | |   | |  \ | |
|___/  |___| |   \| |___
\e[0m"
