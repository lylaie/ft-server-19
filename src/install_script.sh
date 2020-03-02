#!/bin/bash

#UPDATE AND INSTALL SYSTEM

echo "UPDATE AND INSTALL SYSTEM"

apt update > /dev/null
apt upgrade -y > /dev/null
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
apt autoremove > /dev/null
apt-get autoremove > /dev/null

echo "PACKAGES INSTALLATION"

apt install systemd -y > /dev/null
apt install libnss3-tools -y > /dev/null
apt-get install mariadb-server -y > /dev/null
apt-get install mariadb-client -y > /dev/null
apt install php -y > /dev/null
apt install wget -y > /dev/null
apt-get install nginx -y > /dev/null
apt install unzip -y > /dev/null

echo "PACKAGES INSTALLATION DONE"

#NGINX INSTALLATION & CONFIGURATION

echo "NGINX INSTALLATION && CONFIGURATION"

cd
mkdir -p /var/www/localhost/
cp /root/nginx-host-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

echo "NGINX INSTALLED AND CONFIGURED"

#MYSQL CONGFIG

echo "MYSQL CONFIGURATION"

service mysql start
echo "CREATE DATABASE ftserver;" | mysql -u root > /dev/null
echo "GRANT ALL PRIVILEGES ON ftserver.* TO 'root@localhost';" | mysql -u root > /dev/null
echo "FLUSH PRIVILEGES;" | mysql -u root > /dev/null
echo "update mysql.user set plugin = 'mysql_native_password' whre user='root';" | mysql -u root > /dev/null
cd
mysql ftserver -u root --p < ftserver.sql

echo "MYSQL CONFIGURED"


#PHP MYADIND CONFIG
echo "PHYMYADMIN CONFIGURATION"

cd
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip > /dev/null
mkdir -p /var/www/localhost/phpmyadmin > /dev/null
unzip phpMyAdmin-latest-all-languages.zip -d /var/www/localhost/phpmyadmin > /dev/null
apt-get update -y > /dev/null
apt-get upgrade -y > /dev/null
cp /root/config.inc.php /var/www/localhost/phpmyadmin > /dev/null

echo "PHPMYADMIN CONFIGURED"

#WORDPRESS CONFIGURATION

echo "WORDPRESS CONFIGURATION"

cd
tar -xf mywordpress.tar.gz -C /var/www/localhost/ > /dev/null
rm mywordpress.tar.gz
service nginx reload

echo "WORDPRESS CONFIGURED"


