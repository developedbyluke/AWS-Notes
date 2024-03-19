#!/bin/bash

sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

sudo apt install nginx -y

sudo sed -i "s|try_files .*;|proxy_pass http://127.0.0.1:3000;|g" /etc/nginx/sites-available/default

sudo systemctl restart nginx
sudo systemctl enable nginx

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs

sudo apt install git -y

git clone https://github.com/developedbyluke/tech257-sparta-app.git repo

cd repo/app

sudo npm install

sudo npm install pm2 -g

pm2 start app.js