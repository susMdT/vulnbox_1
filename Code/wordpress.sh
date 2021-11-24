#!/bin/bash
#dont run as root probably

sudo apt update -y && sudo apt upgrade -y && sudo apt install curl -y
sudo apt install apache2 apache2-doc apache2-utils libexpat1 ssl-cert -y
sudo apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-curl php7.4-dev php7.4-gd php7.4-mysql libmcrypt-dev -y 

echo "Installing wordpress-cli"
curl -L https://github.com/wp-cli/wp-cli/releases/download/v2.5.0/wp-cli-2.5.0.phar -o wp-cli.phar
chmod +x wp-cli.phar

echo "setting up wp-cli binary in /usr/local/bin"
sudo mv wp-cli.phar /usr/local/bin/wp-cli

echo "making wordpress directory in /var/www/html"
sudo mkdir /var/www/html/wordpress
sudo chmod -R 777 /var/www/html/wordpress

echo "installing wordpress and making configurations "
cd /var/www/html/wordpress &&  wp-cli core download && wp-cli core config --dbname=wordpress --dbuser=wpuser --dbpass=bruh --dbhost=10.10.10.10 
cd /var/www/html/wordpress &&  wp-cli core install --url=http://wordpress.site/ --admin_user=admin --admin_password=NotMeantToBeFound --title=Wordpress --admin_email=admin@localhost.com
sudo chown -R www-data /var/www/html/wordpress
sudo chgrp -R www-data /var/www/html/wordpress
sudo chmod 755 -R /var/www/html/wordpress
