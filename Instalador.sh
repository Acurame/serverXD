#!/bin/bash

echo "-----------------------------------"
echo "Actualizando el sistema"
echo "-----------------------------------"
sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null

echo "Instalando apache"

sudo apt-get install apache2 -y > /dev/null
sudo a2enmod rewrite > /dev/null

echo "-----------------------------------"
echo "Elige el gestor de base de datos"
echo "-----------------------------------"
echo "1. MySql"
echo "2. MariaDB"
echo "-----------------------------------"
read db

if [ "$db" -eq 1 ]; then
    echo "Instalando MySql"
    sudo apt-get install mysql-server -y > /dev/null
elif [ "$db" -eq 2 ]; then
    echo "Instalando MariaDB"
    sudo apt-get install mariadb-server -y > /dev/null
fi

echo "-----------------------------------"
echo "Instalando PHP"
echo "-----------------------------------"
echo "1. Repositorios Externos ondrej"
echo "2. Repositorios Internos"
echo "-----------------------------------"
read php

if [ "$php" -eq 1 ]; then
    echo "Instalando PHP"
    sudo apt install software-properties-common apt-transport-https -y > /dev/null
    sudo add-apt-repository ppa:ondrej/php -y > /dev/null
    sudo apt-get update -y > /dev/null
    sudo apt install php libapache2-mod-php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath curl git unzip -y > /dev/null
elif [ "$php" -eq 2 ]; then
    echo "Instalando PHP"
    sudo apt-get install php libapache2-mod-php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath curl git unzip -y > /dev/null
fi

echo "-----------------------------------"
echo "Instalando Composer"
echo "-----------------------------------"
curl -sS https://getcomposer.org/installer -o composer-setup.php > /dev/null
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer >/dev/null

echo "-----------------------------------"
echo "Instalando Node JS"
echo "-----------------------------------"
echo "1. Especificar Version"
echo "2. Version 22"
echo "-----------------------------------"
read node

NODE_MAJOR=22
if [ "$node" -eq 1 ]; then
    echo "Elige la versión de Node JS"
    read NODE_MAJOR
elif [ "$node" -eq 2 ]; then
    echo "Seleccionando versión 22 de Node.js"
else
    echo "Opción no válida."
    exit 1
fi

sudo apt-get install -y ca-certificates curl gnupg > /dev/null
sudo mkdir -p /etc/apt/keyrings > /dev/null
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
sudo apt-get update -y > /dev/null
sudo apt-get install nodejs -y > /dev/null
