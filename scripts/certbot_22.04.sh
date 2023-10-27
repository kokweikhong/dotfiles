#!/bin/bash


# certbot
echo "This script will install certbot"
echo "---------------------------"

# check whether certbot is installed or not
if [[ -z $(which certbot) ]]; then
    echo "Certbot is not installed"
    # ask whether want to install certbot or not
    read -p "Do you want to install certbot? (y/n) " answer
    if [[ $answer != y && $answer != Y ]]; then
        exit
    fi
    # install certbot
    echo "Step 1: Installing certbot"
    echo "---------------------------"
    sudo apt install certbot python3-certbot-nginx
fi

echo "Step 2: Confirming Nginx's Configuration"
echo "---------------------------"
sudo nginx -t
sudo systemctl reload nginx

echo "Cheking ufw status"
echo "---------------------------"
sudo ufw status verbose

# confirmation
read -p "Do you want to enable HTTPS? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

echo "Step 3: Allowing HTTPS Through the Firewall"
echo "---------------------------"
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw status verbose

echo "Step 4: Obtaining an SSL Certificate"
echo "---------------------------"
# user input 2 domain names
read -p "Enter domain name: " domain
read -p "Enter domain name: " domain2

# confirmation for domain names
read -p "Do you want to continue with domain name $domain and $domain2? (y/n) " answer
if [[ $answer != y && $answer != Y ]]; then
    exit
fi

sudo certbot --nginx -d $domain -d $domain2

echo "Step 5: Verifying Certbot Auto-Renewal"
echo "---------------------------"
sudo systemctl status certbot.timer
sudo certbot renew --dry-run

echo "Done"