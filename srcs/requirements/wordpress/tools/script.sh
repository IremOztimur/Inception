#!/bin/bash
# create directory to use in nginx container later and also to setup the wordpress conf
if [ -d /var/www/html ]; then
    echo "This file already exists."
else
    echo "Create /var/www/html file."
    mkdir /var/www/
    mkdir /var/www/html
fi
    cd /var/www/html
if [ -f /var/www/html/wp-config.php ]; then
    echo "Wordpress now up."
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    mv /wp-config.php /var/www/html/wp-config.php
fi
    mkdir /run/php
    chmod -R 755 /run/php
    service php7.3-fpm restart
    sed -i -r "s/db1/$DB_NAME/1"   wp-config.php
    sed -i -r "s/user/$DB_USER/1"  wp-config.php
    sed -i -r "s/pwd/$DB_PWD/1"    wp-config.php
    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
/usr/sbin/php-fpm7.3 -F
