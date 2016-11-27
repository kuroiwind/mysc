echo "=============================="
echo "        安装EPEL源"
echo "=============================="
yum install epel-release -y
echo "=============================="
echo "        安装常用软件"
echo "=============================="
yum install wget vim screen curl htop -y
echo "=============================="
echo "         更新系统"
echo "=============================="
screen -S yum
yum update -y
echo "=============================="
echo "        增加端口"
echo "=============================="
cat >>/etc/ssh/sshd_config <<EOF
Port 22
Port 28406
EOF
