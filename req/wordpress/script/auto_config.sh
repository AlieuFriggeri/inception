#!/bin/bash

sleep 10

if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    wp config create --dbname=wordpress --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME \
    --allow-root --force
    wp core install --url="afrigger.42.fr" --title="Inception" \
    --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD \
    --admin_email=ppotier@42lausanne.ch --allow-root
	echo "MAIMAMAIMIAL"
    wp user create $MYSQL_USER --user_pass=$MYSQL_PASSWORD --allow-root
    wp config shuffle-salts --allow-root
	# wp post create /tmp/article.txt --post_title="Inception" --post-status=publish --post_author="chatgepeto" --allow-root
	# wp theme install teluro --activate --allow-root
    echo "Wordpress's installation complete"
fi

if wp core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
    php-fpm7.3 -F -R
else
    echo "Wordpress's installation failed"
fi