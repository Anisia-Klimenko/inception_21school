#!/bin/bash
mysql_install_db
/usr/share/mysql/mysql.server start
mysql -e  \
"CREATE DATABASE IF NOT EXISTS ${WP_TITLE}; \
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; \
GRANT ALL PRIVILEGES ON ${WP_TITLE}.* TO '${DB_USER}'@'%'; \
ALTER USER '${DB_ROOT}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}'; \
FLUSH PRIVILEGES;"
mysqladmin --user=${DB_ROOT} --password=${DB_ROOT_PASS} shutdown
exec $@
