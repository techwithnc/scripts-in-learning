# How to instal laravel on ubuntu

# Install php
sudo apt install -y php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-xml php8.1-bcmath

# Install Composer
sudo apt install -y curl php-cli php-mbstring php-curl git unzip

cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Creating Laravel Application
cd ~
composer create-project --prefer-dist laravel/laravel travel_list

cd travel_list
php artisan serve --host 0.0.0.0

# Setting up Nginx Config
sudo mv ~/travel_list /var/www/travel_list

sudo chown -R www-data.www-data /var/www/travel_list/storage
sudo chown -R www-data.www-data /var/www/travel_list/bootstrap/cache

sudo vim /etc/nginx/sites-available/travel_list

server {
    listen 80;
    server_name web102.techwithnc.com;
    root /var/www/travel_list/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}

sudo ln -s /etc/nginx/sites-available/travel_list /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
