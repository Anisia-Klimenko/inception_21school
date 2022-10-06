FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install redis

EXPOSE 6379

COPY ./conf/redis.conf /etc/redis.conf

CMD ["redis-server", "/etc/redis.conf", "--protected-mode no"]
