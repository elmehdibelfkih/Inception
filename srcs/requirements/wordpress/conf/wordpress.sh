#!/bin/bash
set -e
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 755 wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown -R www-data:www-data /var/www/html/
if [ ! -f wp-config.php ]; then
    wp core download --allow-root --locale=en_US
    wp config create \
    --dbname=$MYSQL_WP_DATABASE \
    --dbuser=$MYSQL_WP_USER \
    --dbpass=$MYSQL_WP_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --path=/var/www/html \
    --allow-root
fi

if ! wp core is-installed --allow-root; then
    wp core install \
    --url=$DOMAIN \
    --title="$TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --path=/var/www/html \
    --allow-root
fi

if ! wp user list --field=user_login --allow-root | grep -q "^$WP_USR$"; then
   wp user create \
    "$WP_USR" "$WP_USR_EMAIL" \
    --role=author \
    --user_pass="$WP_USR_PWD" \
    --allow-root 
fi

mkdir -p /run/php
chown root:root /run/php
chmod 755 /run/php
sed -i 's#/run/php/php7.3-fpm.sock#9000#g' /etc/php/7.3/fpm/pool.d/www.conf
php-fpm7.3 --nodaemonize