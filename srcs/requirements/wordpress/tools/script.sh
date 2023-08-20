#!/bin/sh

# Install wp-cli if not already present
if [ ! -f "/usr/local/bin/wp" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    sleep 10
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Create the directory if it doesn't exist
if [ ! -d "/var/www/html/" ]; then
    mkdir -p /var/www/html
fi

# Download WordPress core
wp core download --allow-root --path='/var/www/html'

# Move to the WordPress directory
cd /var/www/html

# Create wp-config.php
wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="mariadb" --path='/var/www/html' --allow-root

# Install WordPress
wp core install --url="$DOMAIN_NAME/" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --skip-email --allow-root --path='/var/www/html'

# Create an author user
wp user create "$USER" "$USER_EMAIL" --role=author --user_pass="$USER_PASSWORD" --allow-root --path='/var/www/html'

# Update PHP-FPM configuration
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

# Create a directory for PHP sockets
mkdir -p /run/php

# Start PHP-FPM
/usr/sbin/php-fpm7.4 --nodaemonize
