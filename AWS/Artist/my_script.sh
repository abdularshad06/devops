#!/bin/bash 
sudo yum install httpd wget zip unzip -y > /dev/null
sudo systemctl start httpd
sudo systemctl enable httpd
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2100_artist.zip > /dev/null
unzip 2100_artist.zip > /dev/null
sudo cp -r 2100_artist/* /var/www/html/
sudo systemctl restart httpd
rm -rf /tmp/webfiles
sudo systemctl restart httpd
