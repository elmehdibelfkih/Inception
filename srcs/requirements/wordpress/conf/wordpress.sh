#!/bin/bash
set -e
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# mv wp-cli-2.11.0.phar wp-cli.phar
chmod 777 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/
chown -R www-data:www-data /var/www/html/
wp core download --allow-root --locale=en_US
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_WP_USER --dbhost=$WORDPRESS_DB_HOST --dbpass=$MYSQL_WP_PASSWORD --allow-root
wp core install --url=$DOMAIN --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_ADMIN_USER $ADMIN_EMAIL_TWO --role=administrator --user_pass=$WP_ADMIN_PASSWORD --allow-root
wp theme install twentysixteen --activate --allow-root
mkdir -p /run/php && chown root:root /run/php && chmod 777 /run/php
sed -i 's#/run/php/php7.3-fpm.sock#9000#g' /etc/php/7.3/fpm/pool.d/www.conf
php-fpm7.3 --nodaemonize
