FROM	debian:buster

RUN apt-get -y update && \
	apt-get -y install mariadb-server && \
	mkdir -p /run/mysqld && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/docker-entrypoint.sh ./

EXPOSE	3306

RUN	chmod +x ./docker-entrypoint.sh

ENTRYPOINT	["./docker-entrypoint.sh"]

CMD	["mysql"]
