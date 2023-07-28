#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget zip unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "##############################################################"
echo "Installing Packages."
echo "##############################################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "##############################################################"
echo "Start & Enable Service"
echo "##############################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "##############################################################"
echo "Starting Artifact Deployment"
echo "##############################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Restart Httpd Service
echo "##############################################################"
echo "Restart Httpd Service"
echo "##############################################################"
sudo systemctl restart $SVC
echo

# Remove Temporary Files
echo "##############################################################"
echo "Remove Temporary Files"
echo "##############################################################"
rm -rf $TEMPDIR
echo

# Service Status and List root dir contents
echo "##############################################################"
echo "Service Status and List root dir contents"
echo "##############################################################"
systemctl status $SVC
ls /var/www/html
echo
