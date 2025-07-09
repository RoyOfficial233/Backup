#!/bin/bash
#Author:RoyOfficial
set -e
if ! command -v zip > /dev/null; then
echo "请安装zip包!/Please install zip package"
exit 0
fi
if [ -z $BAK_CONFIG_FILE ]; then
echo "请选择配置文件的存放位置(默认:/root/.roybakconfig)"
read config_file
if [ -z $config_file ]; then
config_file="/root/.roybakconfig"
fi
echo "BAK_CONFIG_FILE=${config_file}" >> /etc/profile
echo "请输入备份文件存放的位置(默认:/root/backups)"
read Backups

fi
#Example:
#Backups="/www/Backups"
#File="/www/Backups/Full_Backup_`date +%Y%m%d%H%M`.zip"
#P1="/opt/mcsmanager"
#P2="/www/survival.server"
#P3="/root/.ossutilconfig"
#P4="/www/mod.server"
#zip -q -r $File $P1 $P2 $P3 $P4 > /dev/null
#upload() {
#    ossutil -c /root/.ossutilconfig cp $File "oss://roy-baks/Backups/" -fq > /dev/null
#}
#upload