FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install vsftpd

EXPOSE 21100
EXPOSE 21

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./execute/docker-entrypoint.sh ./

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["vsftpd", "/etc/vsftpd.conf"]
