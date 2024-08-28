# #!/bin/bash

set -e
service mysql start

until mysqladmin ping --silent > /dev/null 2>&1; do # Hadi raha khadama
  echo "Waiting for MySQL to start..."
  sleep 2
done
# mysqld_safe --skip-grant-tables &
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
DELETE FROM mysql.user WHERE User='';
-- Disallow root login remotely
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS "$MYSQL_USER"@'localhost' IDENTIFIED BY "$MYSQL_PASSWORD";
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO "$MYSQL_USER"@'localhost';
-- Reload privilege tables
FLUSH PRIVILEGES;
EOF
# mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
mysqld_safe --user=mysql > /dev/null 2>&1 # Hta hadi


# set -e


# echo "Waiting for MariaDB to be ready..."
# # Wait for MariaDB to start
# until mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --execute="SELECT 1" > /dev/null 2>&1; do
#     echo "MariaDB not yet available, retrying..."
#     sleep 2
# done

# echo "MariaDB is up. Starting database setup..."

# # Create a new database and user
# mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<EOF
# CREATE DATABASE IF NOT EXISTS $DB_NAME;
# CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

# -- Flush privileges
# FLUSH PRIVILEGES;
# EOF

# echo "Database and user created successfully."
# mysqld_safe --user=mysql
