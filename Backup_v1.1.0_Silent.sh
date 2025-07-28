#!/bin/bash
#Author:RoyOfficial
set -e
Backups="/www/Backups"
File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
P1="/opt/mcsmanager"
P2="/www/survival.server"
P3="/root/.ossutilconfig"
P4="/www/mod.server"
zip -q -r $File $P1 $P2 $P3 $P4 > /dev/null
ossutil -c /root/.ossutilconfig cp $File "oss://roy-baks/Backups/" -fq > /dev/null