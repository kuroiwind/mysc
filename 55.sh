echo "=============================="
echo "        安装依赖"
echo "=============================="
yum install python-setuptools && easy_install pip -y
yum install git -y
yum -y groupinstall "Development Tools" -y
wget https://github.com/jedisct1/libsodium/releases/download/1.0.13/libsodium-1.0.13.tar.gz
tar xf libsodium-1.0.13.tar.gz && cd libsodium-1.0.13
./configure && make -j2 && make install
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
cd 
pip install cymysql
echo "=============================="
echo "        安装55"
echo "=============================="
wget http://h.148963.com/55.tgz
tar xf 55.tgz
cd shadowsocks
chmod +x *.sh
pip install -r requirements.txt
echo "=============================="
echo "        安装supervisor"
echo "=============================="
cd /root
pip install supervisor
git clone https://github.com/Supervisor/meld3
cd /root/meld3
python setup.py install
echo_supervisord_conf > /etc/supervisord.conf
cat >>/etc/supervisord.conf <<EOF
[program:ss]
command = python /root/shadowsocks/server.py  
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
cd /root/shadowsocks
