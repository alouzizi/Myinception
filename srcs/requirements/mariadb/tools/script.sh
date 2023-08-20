#!/bin/sh
service mariadb start

sleep 10
mariadb -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
