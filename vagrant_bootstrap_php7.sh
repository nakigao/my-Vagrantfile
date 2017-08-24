#!/bin/sh

# keyboard
echo 'KEYTABLE="jp106"' > /etc/sysconfig/keyboard
echo 'MODEL="jp106"' >> /etc/sysconfig/keyboard
echo 'LAYOUT="jp"' >> /etc/sysconfig/keyboard
echo 'KEYBOARDTYPE="p"' >> /etc/sysconfig/keyboard

# yum
yum install yum-fastestmirror
yum upgrade
yum update

# php
yum install -y epel-release
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y --enablerepo=remi,epel,remi-php71 php php-devel php-intl php-pear php-mbstring php-pdo php-mysql php-gd php-mcrypt php-opcache
sed -i -e "s|;error_log = syslog|error_log = /var/log/php.log|" /etc/php.ini
sed -i -e "s|;mbstring.language = Japanese|mbstring.language = Japanese|" /etc/php.ini
sed -i -e "s|;mbstring.internal_encoding = EUC-JP|mbstring.internal_encoding = UTF-8|" /etc/php.ini
sed -i -e "s|;mbstring.http_input = auto|mbstring.http_input = auto|" /etc/php.ini
sed -i -e "s|;mbstring.detect_order = auto|mbstring.detect_order = auto|" /etc/php.ini
sed -i -e "s|expose_php = On|expose_php = Off|" /etc/php.ini
sed -i -e "s|;date.timezone =|date.timezone = Asia/Tokyo|" /etc/php.ini

# mysql
yum install -y  mysql mysql-devel mysql-server mysql-utilities
yum --enablerepo=remi install -y mysql-server
sed -i -e "4i character_set_server=utf8" /etc/my.cnf
sed -i -e "5i default-storage-engine=InnoDB" /etc/my.cnf
sed -i -e "6i innodb_file_per_table" /etc/my.cnf
sed -i -e "7i [mysql]" /etc/my.cnf
sed -i -e "8i default-character-set=utf8" /etc/my.cnf
sed -i -e "9i [mysqldump]" /etc/my.cnf
sed -i -e "10i default-character-set=utf8" /etc/my.cnf
service mysqld start
chkconfig mysqld on

# httpd
yum install -y  httpd httpd-devel
sed -i -e "s|#ServerName www.example.com:80|ServerName localhost:80|" /etc/httpd/conf/httpd.conf
sed -i -e "s|Listen 80|Listen 192.168.100.100:80" /etc/httpd/conf/httpd.conf
echo '<?php phpinfo(); ?>' > /var/www/html/index.php
service httpd restart
chkconfig httpd on

# etc
yum install -y rsync tree git zip unzip
