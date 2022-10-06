#!/bin/bash

vsftpd_stop() {
  echo "Received SIGINT or SIGTERM. Shutting down vsftpd"
  # Set TERM
  kill -TERM "${pid}"
  # Wait for exit
  wait "${pid}"
  # All done.
  echo "Done"
}

adduser ${FTP_USER} --disabled-password
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
echo ${FTP_USER} >> /etc/vsftpd.userlist

mkdir -p /var/www/html && mkdir -p /var/ftp
chown -R ${FTP_USER}:${FTP_USER} /var/www/html

if [[ "${1}" == "vsftpd" ]]; then
  trap vsftpd_stop SIGINT SIGTERM
  echo "Running ${*}"
  "${@}" &
  pid="${!}"
  wait "${pid}" && exit ${?}
else
  exec "${@}"
fi