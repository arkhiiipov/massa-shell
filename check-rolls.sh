#!/bin/bash

wallet=" 1 0"
rolls="Active rolls"
today=`date +%Y-%m-%d.%H:%M:%S`

cd /root/massa/massa-client/ && ./massa-client wallet_info; cd

if [[ ${rolls[*]} =~ 0 ]]
    then echo 'Срочно нужно купить роллы!'
    cd /root/massa/massa-client/ && ./massa-client buy_rolls $wallet; cd

else
    echo $today 'Роллы на месте! Можно спать спокойно!' >>  rolls.log
fi
