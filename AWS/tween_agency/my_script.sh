#!/bin/bash 
sudo apt update
sudo apt install apache2 wget unzip -y
sudo wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
sudo unzip 2128_tween_agency.zip
sudo cp -r 2128_tween_agency/* /var/www/html
sudo systemctl restart apache2
