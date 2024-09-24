#!/bin/bash
sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# set -e
service mysql start
until mysqladmin ping --silent; do
  echo "Waiting for MySQL to start..."
  sleep 2
done
echo "1 <=> MySQL is running"
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DATABASE;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_WP_USER'@'%' IDENTIFIED BY '$MYSQL_WP_PASSWORD';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DATABASE.* TO '$MYSQL_WP_USER'@'%';" >> db1.sql
mysql < db1.sql
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

exec "$@"