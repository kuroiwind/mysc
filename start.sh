echo "=============================="
echo "        安装EPEL源"
echo "=============================="
yum install epel-release -y
echo "=============================="
echo "         更新系统"
echo "=============================="
yum update -y
echo "=============================="
echo "        安装常用软件"
echo "=============================="
yum install wget vim screen curl htop -y