#!/bin/bash
#Author:RoyOfficial
set -e
Backups="/www/Backups"
File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
Log="/www/Backups/Full_Backup_Log_`date +%Y%m%d%H%M`.log"
#P1="/www/main"
P2="/www/survival.server"
P3="/www/mods.server"
zip -r $File $P1 $P2 $P3 -v > $Log
ossutil --loglevel=debug -c /root/.ossutilconfig --log-file=- cp $File "oss://roy-baks/Backups/" --copy-props=metadata  -f --storage-class=Archive >> $Log
ossutil --loglevel=debug -c /root/.ossutilconfig --log-file=- cp $Log "oss://roy-baks/Backups/" --copy-props=metadata -f --storage-class=Archive