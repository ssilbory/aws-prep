#!/bin/bash 
sudo apt-get -y update
sudo apt-get -y install nginx
sudo systemctl start nginx 
sudo systemctl enable nginx 
echo Cisco SPL| sudo tee /var/www/html/index.nginx-debian.html
