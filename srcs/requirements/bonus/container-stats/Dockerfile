FROM debian:buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
	echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list && \
	apt-get -y update && \
	apt-get -y install -t buster-backports supervisor npm docker.io sqlite && \
	apt-get -y --allow-downgrades reinstall libcurl3-gnutls/buster && \
    apt-get -y install git && \
	git clone https://github.com/virtualzone/docker-container-stats.git /opt/docker-stats && \
    cp /opt/docker-stats/supervisord.conf /etc/supervisord.conf && \
	mkdir /opt/docker-stats/db && \
	cd /opt/docker-stats && \
    npm update && \
    npm install express sqlite3 body-parser moment

EXPOSE 8080

CMD supervisord
