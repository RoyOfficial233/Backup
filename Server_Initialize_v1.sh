#!/bin/bash
#Author: RoyOfficial
echo "!!该脚本仅供国内用户使用(清华大学镜像源),且仅支持ubuntu 22.04 24.04用户"
echo "!!This script is only for China ainland users (tuna mirror source) and only supports Ubuntu 22.04 24.04 users"
echo "是否继续?(y/N)"
echo "Do you want to confirm?(y/N)"
read confirm
if [ -z $confirm ] || [ $confirm == "n" ] || [ $confirm == "N" ]; then
exit 0
fi
mkdir -p /www
cd /www
unlink /bin/dw8 > /dev/null
unlink /bin/dw21 > /dev/null
rm -rf /bin/dw8 > /dev/null
rm -rf /bin/dw21 > /dev/null
if cat /etc/os-release | grep Ubuntu > /dev/null; then
if cat /etc/os-release | grep 22.04 > /dev/null; then
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

# 预发布软件源，不建议启用
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse" > /etc/apt/sources.list
apt update
apt install wget curl unzip zip lrzsz net-tools -y
fi
elif cat /etc/os-release | grep 24.04 > /dev/null; then
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-backports main restricted universe multiverse
# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-security main restricted universe multiverse

# 预发布软件源，不建议启用
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-proposed main restricted universe multiverse" > /etc/apt/sources.list
apt update
apt install wget curl unzip zip lrzsz net-tools -y
else
echo "不支持该系统"
exit 0
fi
wget -O /www/dw8.tar.gz https://dragonwell.oss-cn-shanghai.aliyuncs.com/8.25.24/Alibaba_Dragonwell_Extended_8.25.24_x64_linux.tar.gz
tar zxvf /www/dw8.tar.gz
mv /www/dragonwell-8* /www/dw8
ln -s /www/dw8/bin/java /bin/dw8
chmod 777 /bin/dw8
wget -O /www/dw21.tar.gz https://dragonwell.oss-cn-shanghai.aliyuncs.com/21.0.7.0.7%2B6/Alibaba_Dragonwell_Extended_21.0.7.0.7.6_x64_linux.tar.gz
tar zxvf /www/dw21.tar.gz
mv /www/dragonwell-21* /www/dw21
ln -s /www/dw21/bin/java /bin/dw21
chmod 777 /bin/dw21
echo "MCSManager installation will begin in 5 seconds... (Ctrl+C to exit)"
sleep 5s
sudo su -c "wget -qO- https://script.mcsmanager.com/setup_cn.sh | bash"