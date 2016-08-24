echo "新建线程"
screen -S lnmp

echo "开始LNMP"
wget -c http://soft.vpser.net/lnmp/lnmp1.3-full.tar.gz && tar zxf lnmp1.3-full.tar.gz && cd lnmp1.3-full && ./install.sh lnmp

echo "SS安装"

git clone -b manyuser https://github.com/kuroiwind/shadowsocks-rm.git

echo "安装SETUP TOOLS"
wget https://bootstrap.pypa.io/ez_setup.py -O - | python

echo "安装PIP"
wget https://pypi.python.org/packages/e7/a8/7556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13/pip-8.1.2.tar.gz

tar zxvf pip-8.1.2.tar.gz
cd pip-8.1.2
python setup.py install

echo "安装CYMYSQL"
pip install cymysql

echo "安装supervisor"
pip install supervisor

echo_supervisord_conf > /etc/supervisord.conf

cat >>/etc/supervisord.conf <<EOF
[program:ss]
command = python /root/shadowsocks-rm/shadowsocks/servers.py  
user = root  
autostart = true  
autorestart = true
startsecs=10
startretries=36
stderr_logfile = /root/shadowsocks.err.log
stdout_logfile = /root/shadowsocks.out.log
logfile_maxbytes=1MB
logfile_backups=10
EOF

wget --directory-prefix=/etc/init.d/ https://raw.githubusercontent.com/kuroiwind/mysc/master/supervisord

chmod +x /etc/init.d/supervisord
chkconfig supervisord on