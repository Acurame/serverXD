#!/bin/bash
sudo apt update
sudo apt install apache2
sudo apt install mysql-server
systemctl reload apache2
sudo apt install software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.1 libapache2-mod-php8.1
sudo apt install php-mysql php-xml php-gd php-mbstring php-mysql php-bcmath curl php-cli php-mbstring git unzip
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath
sudo apt update
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#sudo apt-get install phpmyadmin
#sudo echo -e "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
sudo ufw allow https
sudo ufw allow http
sudo ufw allow 'Apache'
sudo ufw enable
sudo ufw status