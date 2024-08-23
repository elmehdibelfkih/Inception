#!/bin/bash

# Secure the installation by executing SQL commands directly
set -e

mysqld_safe --skip-grant-tables

mysql -u root <<EOF
-- Set the root password
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- Disallow root login remotely
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');

-- Remove the test database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE USER '$MYSQL_USER'@'host' IDENTIFIED BY '$MYSQL_PASSWORD';

GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
CREATE DATABASE $MYSQL_DATABASE;






-- Reload privilege tables
FLUSH PRIVILEGES;



EOF
tail -f /dev/null