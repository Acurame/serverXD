#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo a2enmod rewrite 
systemctl reload apache2 -y
sudo apt install software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php libapache2-mod-php -y
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath curl git unzip -y
sudo apt update
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#sudo apt-get install phpmyadmin
#sudo echo -e "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
sudo apt-get install -y ca-certificates curl gnupg -y
sudo mkdir -p /etc/apt/keyrings -y
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
sudo apt-get install nodejs -y
#activar si vamos a usar un servidor real 
#sudo ufw allow https
#sudo ufw allow http
#sudo ufw allow 'Apache'
#sudo ufw enable
#sudo ufw status