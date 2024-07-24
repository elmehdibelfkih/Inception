-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- Disallow root login remotely
UPDATE mysql.user SET Host='localhost' WHERE User='root';

-- Remove the test database
DROP DATABASE IF EXISTS test;

-- Reload privilege tables
FLUSH PRIVILEGES;
