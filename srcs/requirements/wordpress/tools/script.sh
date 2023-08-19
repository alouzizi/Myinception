
# mkdir /var/www/
# mkdir /var/www/html


# cd /var/www/html

# rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sleep 10
chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --path='/var/www/html'


mkdir -p /var/www/html
# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php
cd /var/www/html

wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --path='/var/www/html' --allow-root

wp core install --url=$DOMAIN_NAME/ --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root --path='/var/www/html'

wp user create $USER $USER_EMAIL --role=author --user_pass=$USER_PASSWORD --allow-root --path='/var/www/html'

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.4 --nodaemonize

