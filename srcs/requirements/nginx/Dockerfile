FROM	debian:buster

RUN	apt-get -y update && \
	apt-get -y install nginx openssl && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:2048 -x509 -nodes -days 365 \
	-out /etc/nginx/ssl/acristin.crt \
	-keyout /etc/nginx/ssl/acristin.key \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=school21/OU=acristin/CN=https:acristin.42.fr/emailAddress=acristin@42.fr"

COPY	/conf/config /etc/nginx/sites-available/default

EXPOSE	443

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
