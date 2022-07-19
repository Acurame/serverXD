#!/bin/bash
sudo su
sudo apt update
sudo apt install apache2 --no
systemctl reload apache2
sudo apt install mysql-server
sudo apt install php
sudo apt install libapache2-mod-php
sudo apt install php-mysql
sudo apt-get update
sudo apt install php-xml
sudo apt install php-gd
sudo apt install php-mbstring
sudo apt install php-mysql
sudo apt install php-bcmath
sudo apt update
sudo apt install curl php-cli php-mbstring git unzip
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo apt-get install phpmyadmin
sudo echo -e "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
sudo apt install nodejs npm