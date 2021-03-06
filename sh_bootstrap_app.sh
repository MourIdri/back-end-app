#!/bin/bash
apt-get update -y

# install PHP and MySQL
apt-get install git ifstat inetutils-traceroute traceroute telnet curl python python-pip python3 python3-pip libapache2-mod-python libapache2-mod-php php-mysql -y
apt-get install mysql-client -y
pip install requests flask ConfigParser mysql-connector-python flask-restful ast 
pip3 install requests 
apt-get install -y \
php libapache2-mod-php php-gd php-json php7.0-sqlite php-mysql php-mcrypt mcrypt ifstat inetutils-traceroute traceroute \
telnet curl python python-pip python3 python3-pip libapache2-mod-python libapache2-mod-php php-mysql mysql-client php php-fpm php-mysql \
php-curl php-gd php-pear php-imagick php-imap php-mcrypt php-recode php-tidy php-xmlrpc php-curl php-gd php-intl php-json php-mbstring \
php-mcrypt php-xml \
php-zip

apt-get remove apache2 -y 
#systemctl enable mariadb.service

export DB_NAME=customersDB
export DB_USER=root
export DB_PWD=password



#Make dirs
mkdir /APP/
cd /APP/
rm -rf /APP/*

git clone  https://github.com/MourIdri/back-end-app.git
chmod -R 777 /APP/*
cd /APP/back-end-app/
python app.py & echo "Script done app has been started as a thread "