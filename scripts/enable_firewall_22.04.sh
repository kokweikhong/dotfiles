#!/bin/bash

echo "This script will enable firewall and allow ssh, http, https, and port 8080"

# ask reset and disable firewall
read -p "Do you want to reset and disable firewall? (y/n) " answer
# if yes, then reset and disable firewall
if [[ $answer == y || $answer == Y ]]; then
    echo "Resetting firewall"
    echo "---------------------------"
    sudo ufw reset
    echo "Disabling firewall"
    echo "---------------------------"
    sudo ufw disable
fi


# check firewall status
echo "Checking firewall status"
echo "---------------------------"
sudo ufw status verbose

echo "Step 1: Using IPv6 with UFW (Optional)"
echo "---------------------------"
# confirmation
read -p "Do you want to enable IPv6? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

# enable IPv6
sudo sed -i 's/IPV6=no/IPV6=yes/g' /etc/default/ufw

echo "Step 2: Setting Up Default Policies"
echo "---------------------------"
# confirmation
read -p "Do you want to set default policies? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

# set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Step 3: Allowing SSH Connections"
echo "---------------------------"
# confirmation
read -p "Do you want to allow SSH connections? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

# allow ssh
sudo ufw allow ssh
sudo ufw allow 22/tcp

# ask for port numbers to allow
read -p "Do you want to allow any other port? (y/n) " answer
# if yes, then ask for port number and allow it
while [[ $answer == y || $answer == Y ]]; do
    read -p "Enter port number: " port
    sudo ufw allow $port
    read -p "Do you want to allow any other port? (y/n) " answer
done

echo "Step 4: Allowing HTTP and HTTPS Connections"
echo "---------------------------"
# confirmation
read -p "Do you want to allow HTTP and HTTPS connections? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

# enable firewall
echo "Enabling firewall"
echo "---------------------------"
sudo ufw enable

# allow http and https
sudo ufw allow http
sudo ufw allow https

