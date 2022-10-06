FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install php7.3 php-mysqli php-fpm wget && \
	mkdir -p /var/www/html/ && \
	chown -R www-data:www-data /var/www/* && \
	chown -R 755 /var/www/* && \
	mkdir -p /run/php/ && \
	touch /run/php/php7.3-fpm.pid && \
	wget -O "/var/www/html/index.php" "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php"

EXPOSE 8080

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
