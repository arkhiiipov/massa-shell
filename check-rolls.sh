#!/bin/bash

wallet="25....."

today=`date +%Y-%m-%d.%H:%M:%S`

rolls=$(echo `cd /root/massa/massa-client/ && ./massa-client wallet_info | grep rolls | awk '{print $3}'; cd`)

IFS=' ' read -a roll <<< $rolls
if [ "${roll[0]}" = "0" ] && [ "${roll[1]}" = "0" ] && [ "${roll[2]}" = "0" ] ;then
    cd /root/massa/massa-client/ && ./massa-client buy_rolls $wallet 1 0; cd
    echo $today' Куплен 1 roll!' >>  rolls.log
else
    echo "ok"
fi

