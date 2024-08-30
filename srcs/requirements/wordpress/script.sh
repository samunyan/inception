#!/bin/sh

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html/

if [ ! -f ./wp-config.php ]; then
  wp core download --allow-root

  wp config create --allow-root \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_USER_PASSWD \
    --dbhost=$DB_HOSTNAME

  wp core install --allow-root \
    --title=$WP_TITLE \
    --url=$DOMAIN_NAME \
    --admin_user=$WP_ROOT_USER \
    --admin_password=$WP_ROOT_PASSWD \
    --admin_email=$WP_ROOT_EMAIL

  wp user create --allow-root \
    $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD

  wp theme install twentysixteen --activate --allow-root
fi

exec /usr/sbin/php-fpm7.4 -F