#!/bin/bash

# Enter html directory
sudo cd /var/www/html/

# Create cache and chmod folders
sudo mkdir -p /var/www/html/bootstrap/cache
sudo mkdir -p /var/www/html/storage/framework/sessions
sudo mkdir -p /var/www/html/storage/framework/views
sudo mkdir -p /var/www/html/storage/framework/cache
sudo mkdir -p /var/www/html/public/files/

# Install dependencies
sudo export COMPOSER_ALLOW_SUPERUSER=1
sudo composer install -d /var/www/html/

# Copy configuration from /var/www/.env, see README.MD for more information
sudo cp /var/www/.env /var/www/html/.env

# Migrate all tables
sudo php /var/www/html/artisan migrate

# Clear any previous cached views
sudo php /var/www/html/artisan config:clear
sudo php /var/www/html/artisan cache:clear
sudo php /var/www/html/artisan view:clear

# Optimize the application
sudo php /var/www/html/artisan config:cache
sudo php /var/www/html/artisan optimize
#php /var/www/html/artisan route:cache

# Change rights
sudo sudochmod 777 -R /var/www/html/bootstrap/cache
sudo chmod 777 -R /var/www/html/storage
sudo chmod 777 -R /var/www/html/public/files/

# Bring up application
sudo php /var/www/html/artisan up
