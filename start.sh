#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "========================="
echo "安装EPEL源"
echo "========================="
sudo yum install epel-release -y
echo "========================="
echo "更新系统"
echo "========================="
sudo yum update -y
echo "========================="
echo "安装常用软件"
echo "========================="
sudo yum install wget vim screen curl htop -y
echo "========================="
echo "安装完成"
echo "========================="
