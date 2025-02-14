#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" > /docker-entrypoint-initdb.d/init.sql

echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /docker-entrypoint-initdb.d/init.sql

echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.d/init.sql

echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

if [ -n "$(ls -A /var/lib/mysql)" ]; then
	echo "Database already initialized"
else
	echo "Initializing database"
	gosu mysql mysql_install_db --user=mysql

fi

exec "$@"