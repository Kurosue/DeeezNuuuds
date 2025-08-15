#!/bin/bash
apt install apache2 -y
sed -i 's/80/8080/' /etc/apache2/ports.conf
sed -i 's/:80/:8080/' /etc/apache2/sites-available/000-default.conf
echo "<h1>Suck On DEEEEZNUUUUTS</h1>" > /var/www/html/index.html
systemctl restart apache2


