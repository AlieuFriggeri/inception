#!/bin/bash

sleep 10

if ! wp core is-installed --allow-root  ; then
    wp core download --allow-root --force
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_ROOT_USER \
    --dbpass=$MYSQL_ROOT_PASSWORD --dbhost=localhost \
    --allow-root --force
    wp core install --url="afrigger.42.fr" --title="wordpress" \
    --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD \
    --admin_email=alieufriggeri00@gmail.com --allow-root
	echo "MAIMAMAIMIAL"
    wp user create $MYSQL_ROOT_USER $MYSQL_MAIL --user_pass=$MYSQL_ROOT_PASSWORD --allow-root
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