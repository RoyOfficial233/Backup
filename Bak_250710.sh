#!/bin/bash
#Author: RoyOfficial
mkdir /www/Backups -p
File="/www/Backups/SGY_Server_`date +%Y%m%d%H%M`.zip"
zip -r $File /www
ossutil -c /root/.ossutilconfig cp $File "oss://roy-baks/Backups/" -fq > /dev/null
rm -rf $File