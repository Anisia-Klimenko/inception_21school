FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config.php /var/www/
COPY ./execute/docker-entrypoint.sh ./

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
