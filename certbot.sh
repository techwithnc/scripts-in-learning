# How to set up SSL on website using CertBot
# Website is running Nginx on ubuntu 22.04

# Ensure that your version of snapd is up to date
sudo snap install core; sudo snap refresh core

# Install Certbot
sudo snap install --classic certbot

# Prepare the Certbot command 
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# Run this command to get a certificate and have Certbot edit your nginx configuration automatically to serve it, turning on HTTPS access in a single step.
sudo certbot --nginx


