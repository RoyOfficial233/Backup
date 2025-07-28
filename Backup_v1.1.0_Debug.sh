#!/bin/bash
#Author:RoyOfficial
set -e
Backups="/www/Backups"
File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
Compress_Log="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`_Compress.log"
Upload_Log="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`_Upload.log"
P1="/opt/mcsmanager"
P2="/www/survival.server"
P3="/root/.ossutilconfig"
P4="/www/mod.server"
zip -vr "${File}" "${P1}" "${P2}" "${P3}" "${P4}" > "${Compress_Log}"
ossutil --loglevel=debug --log-file="${Upload_Log}" -c /root/.ossutilconfig cp "${File}" "oss://roy-baks/Backups/" -f
ossutil -c /root/.ossutilconfig cp "${Upload_Log}" "oss://roy-baks/Backups/" -fq
ossutil -c /root/.ossutilconfig cp "${Compress_Log}" "oss://roy-baks/Backups/" -fq