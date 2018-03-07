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
git clone -b manyuser https://github.com/glzjin/shadowsocks.git
cd shadowsocks
chmod +x *.sh
cp apiconfig.py userapiconfig.py
cp config.json user-config.json
