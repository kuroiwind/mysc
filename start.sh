echo "安装EPEL源"
yum install epel-release -y
echo "更新系统"
yum update -y
echo "安装常用软件"
yum install wget vim screen curl htop -y
