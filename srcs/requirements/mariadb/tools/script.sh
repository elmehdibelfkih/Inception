#!/bin/bash
sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
set -e
service mysql start
until mysqladmin ping --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DATABASE;" > init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DATABASE.* TO '$MYSQL_WP_USER'@'%';" >> init.sql
mysql -u root -p$MYSQL_ROOT_PASSWORD < init.sql
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
exec "$@"