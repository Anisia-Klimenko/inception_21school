FROM debian:buster
RUN apt-get -y update && \
	apt-get -y install nginx && \
	mkdir -p /var/www/html

EXPOSE 4000

COPY /conf/nginx.conf /etc/nginx/sites-available/default
COPY /site /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
