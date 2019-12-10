#UPDATE && CLEAN

apt update && apt-get update
apt upgrade -y && apt-get upgrade -y
apt autoremove && apt-get autoremove

#INSTALLATION PACKAGES

apt -y install systemct1
apt-get -y install mariadb-server wget php-mysql libnss3-tools nginx
apt -y install php-{mbtring,zip,gd,xml,pear,gettext,cli,fpm,cgi}

#NGINX CONFIG

systemctl start nginx
systemctl status nginx
cd
mkdir /var/www/localhost
cp /root/nginx-host-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost/ /etc/nginx/sites-enabled/

#WORDPRESS CONFIG
cd
tar -xf mywordpress.tar.gz -C /var/www/localhost/
rm wordpress.tar.gz
systemctl reload nginx

