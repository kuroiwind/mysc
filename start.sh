echo "安装EPEL源"
yum install -y epel-release
echo "更新系统"
yum -y update
echo "安装常用软件"
yum install -y wget vim screen curl htop
