#!/bin/bash

# Variable Declaration
#PACKAGE="httpd wget zip unzip"
#SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2098_health.zip"
#ART_NAME="2098_health"
#TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "##############################################################"
echo "Installing Packages."
echo "##############################################################"
sudo yum install httpd wget zip unzip -y > /dev/null
echo

# Start & Enable Service
echo "##############################################################"
echo "Start & Enable Service"
echo "##############################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "##############################################################"
echo "Starting Artifact Deployment"
echo "##############################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Restart Httpd Service
echo "##############################################################"
echo "Restart Httpd Service"
echo "##############################################################"
sudo systemctl restart httpd
echo

# Remove Temporary Files
echo "##############################################################"
echo "Remove Temporary Files"
echo "##############################################################"
rm -rf /tmp/webfiles
echo

# Service Status and List root dir contents
echo "##############################################################"
echo "Service Status and List root dir contents"
echo "##############################################################"
systemctl status httpd
ls /var/www/html
echo
