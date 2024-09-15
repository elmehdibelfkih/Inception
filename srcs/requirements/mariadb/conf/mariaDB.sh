#!/bin/bash
sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
set -e
service mysql start
sleep 3
until mysqladmin ping --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done
# chown -R mySql:mySql /var/lib/mysql
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DATABASE"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD'"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_WP_DATABASE.* TO '$MYSQL_WP_USER'@'%'"
mysql -e "FLUSH PRIVILEGES"
mysqladmin shutdown
mysqld
#--port=3306 --bind-address=0.0.0.0

# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DATABASE"
# mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_WP_USER'@'localhost' IDENTIFIED BY '$MYSQL_WP_PASSWORD'"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_WP_DATABASE.* TO '$MYSQL_WP_USER'@'localhost'"
# mysql -u root -e "FLUSH PRIVILEGES"
# mysqladmin -u root shutdown
# service mysql start


