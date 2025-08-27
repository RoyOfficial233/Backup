#!/bin/bash
#Author:RoyOfficial
set -e
backup_file() {
    Path_Count=`expr ${Path_Count} + 1`
    echo "请输入需要备份的目录/文件"
    read P${Path_Count}
    if [ -z $P${Path_Count} ]; then
    echo "输入格式错误"
    exit 0
    fi
    echo "是否要添加`expr ${Path_Count} + 1`个文件/目录(y/N)"
    read Path_Add
    shopt -s nocasematch
    if [ $Path_Add == "y" ]; then
    backup_file
    fi
}
if ! command -v zip > /dev/null; then
echo "请安装zip与unzip!"
exit 0
fi
if [ -z $BAK_CONFIG_FILE ]; then
echo "请选择配置文件的存放位置"
read config_file
if [ -z $config_file ]; then
echo "输入格式错误"
exit 0
fi
echo "BAK_CONFIG_FILE=${config_file}" >> /etc/profile
source /etc/profile
echo "请输入备份文件存放的位置"
read Backups
if [ -z $Backups ]; then
echo "输入错误"
exit 0
fi
Path_Count=0
backup_file
echo $
fi