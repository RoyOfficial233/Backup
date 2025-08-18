#!/bin/bash
#Author:RoyOfficial
Backups="/www/Backups"
File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
Compress_Log="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`_Compress.log"
P1="/opt/mcsmanager"
P2="/www/survival.server"
P3="/root/.ossutilconfig"
P4="/www/mod.server"
zip -vr $File $P1 $P2 $P3 $P4 > $Compress_Log