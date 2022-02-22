#!/bin/bash

apt-get update
apt-get install -y apache2

#cp /vagrant/000-default.conf /etc/apache2/sites-enabled/000-default.conf
cp /vagrant/http/index.html /var/www/html/index.html

systemctl reload apache2