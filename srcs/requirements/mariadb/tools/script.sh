#!/bin/bash
service mariadb start

sleep 10
mariadb -e "CREATE DATABASE IF NOT EXISTS Mydata;"
mariadb -e "CREATE USER IF NOT EXISTS 'alouzizi'@'localhost' IDENTIFIED BY 'root@42';"
mariadb -e "GRANT ALL PRIVILEGES ON Mydata.* TO 'alouzizi'@'%' IDENTIFIED BY 'root@42';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root@42';"
# service mariadb restart

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

# mysqladmin -u root -p \`${SQL_ROOT_PASSWORD}\` shutdown
# echo "debuuuubg\n"
# mysqladmin shutdown -p 'root@42'
# echo "2debuuuubg\n"
mysqld 
