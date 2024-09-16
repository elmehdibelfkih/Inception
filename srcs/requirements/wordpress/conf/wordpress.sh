#!/bin/bash
set -e

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Set permissions
chmod 755 wp-cli.phar

# Move WP-CLI to a directory in PATH
mv wp-cli.phar /usr/local/bin/wp

# Set up WordPress
cd /var/www/html/
chown -R www-data:www-data /var/www/html/

# Check if WordPress is already installed
if [ ! -f wp-config.php ]; then
    # Download WordPress core
    wp core download --allow-root --locale=en_US

    # Create wp-config.php
    wp config create --dbname=$MYSQL_WP_DATABASE --dbuser=$MYSQL_WP_USER --dbhost=$WORDPRESS_DB_HOST --dbpass=$MYSQL_WP_PASSWORD --allow-root
else
    echo "WordPress already installed or wp-config.php exists."
fi

# Install WordPress if not installed
if ! wp core is-installed --allow-root; then
    wp core install --url=$DOMAIN --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
fi

# Create admin user if not exists
# if ! wp user get $WP_ADMIN_USER --allow-root > /dev/null 2>&1; then
#     wp user create $WP_ADMIN_USER $ADMIN_EMAIL_TWO --role=administrator --user_pass=$WP_ADMIN_PASSWORD --allow-root
# fi

# Install and activate theme if not already activated
# if ! wp theme is-active twentysixteen --allow-root; then
#     wp theme install twentysixteen --activate --allow-root
# fi

# PHP-FPM setup
mkdir -p /run/php
chown root:root /run/php
chmod 755 /run/php

# Update PHP-FPM socket configuration
sed -i 's#/run/php/php7.3-fpm.sock#9000#g' /etc/php/7.3/fpm/pool.d/www.conf

# Start PHP-FPM in the foreground
php-fpm7.3 --nodaemonize
