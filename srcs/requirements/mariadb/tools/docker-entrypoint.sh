#!/bin/bash
set -e

# Start MariaDB service
mysqld_safe --skip-grant-tables &

# Wait for MariaDB to start
sleep 10

# Secure installation commands
mysql --user=root <<_EOF_
  DELETE FROM mysql.user WHERE User='';
  UPDATE mysql.user SET Host='localhost' WHERE User='root';
  DROP DATABASE IF EXISTS test;
  FLUSH PRIVILEGES;
_EOF_

# Initialize the database if not already initialized
# if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
#   mysql --user=root <<_EOF_
#     CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
#     CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
#     FLUSH PRIVILEGES;
# _EOF_
# fi

# # Run any SQL scripts in the docker-entrypoint-initdb.d directory
# for f in /docker-entrypoint-initdb.d/*.sql; do
#   echo "Running $f..."
#   mysql --user=root $MYSQL_DATABASE < "$f"
# done

# Keep the container running
tail -f /dev/null