#!/bin/sh
echo "========================="
echo "安装EPEL源"
echo "========================="
yum -y install epel-release
echo "========================="
echo "更新系统"
echo "========================="
yum -y update
echo "========================="
echo "安装常用软件"
echo "========================="
yum -y install wget vim screen curl htop
echo "========================="
echo "安装完成"
echo "========================="
