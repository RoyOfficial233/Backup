#!/bin/bash
#Author RoyOfficial
set -e
#Backups="/www/Backups"
Backups=
#Backups:存储备份文件的目录
#File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
File="_`date +%Y%m%d%H%M`.zip"
#File:备份文件的名称(日期格式:YYYYMMDDHHMM)
#Log="/www/Backups/Full_Backup_Log_`date +%Y%m%d%H%M`.log"
Log="_`date +%Y%m%d%H%M`.Log"
#Log:日志文件的名称
#P1="/www/main"
P1=
#P1:要备份的目录 如需要可以增加P1 P2 P3等.
#P2="/www/survival.server"
#P3="/www/mods.server"
zip -r $File $P1 $P2 $P3 -v > $Log
#ossutil --loglevel=debug -c /root/.ossutilconfig --log-file=- cp $File "oss://roy-baks/Backups/" --copy-props=metadata  -f --storage-class=Archive >> $Log
#ossutil --loglevel=debug -c /root/.ossutilconfig --log-file=- cp $Log "oss://roy-baks/Backups/" --copy-props=metadata -f --storage-class=Archive