#!/bin/bash
sudo sustemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y
