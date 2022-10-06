#!/bin/bash

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;
chown -R www-data:www-data /run/php/*
chown -R www-data:www-data /etc/php/*

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: SETUP"
	cd /var/www/
	sed -i "3i define('DB_NAME', '$WP_TITLE');" wp-config.php
	sed -i "4i define('DB_USER', '$DB_USER');" wp-config.php
	sed -i "4i define('DB_PASSWORD', '$DB_PASS');" wp-config.php
	sed -i "14i define('WP_REDIS_PASSWORD', '$REDIS_PASSWORD');" wp-config.php
	sed -i "16i define('WP_CACHE_KEY_SALT', '$DB_USER.42.fr');" wp-config.php
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	# echo "Wordpress: USERS"
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} \
		--user_pass=${WP_USER_PASSWORD};
    # echo "Wordpress: CACHE"
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
	echo "Wordpress: OK"
fi

exec "$@"