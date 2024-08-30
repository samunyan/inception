#!/bin/sh

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" | mysql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD' ;" | mysql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWD' ;" | mysql

mysql $DB_NAME -uroot -p$DB_ROOT_PASSWD
mysqladmin -uroot -p$DB_ROOT_PASSWD shutdown

exec mariadbd