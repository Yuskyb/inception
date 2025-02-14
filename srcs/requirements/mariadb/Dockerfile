FROM debian:bullseye

RUN apt update
RUN apt install -y \
		mariadb-server \
		mariadb-client \
		gosu \
		vim

RUN mkdir -p /run/mysqld  && chown -R mysql:mysql /run/mysqld 
RUN mkdir -p var/log/mysql && chown -R mysql:mysql /var/log/mysql && chmod 755 /var/log/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql && rm -rf /var/lib/mysql/*

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir -p /docker-entrypoint-initdb.d

RUN chown root:root /usr/local/bin/entrypoint.sh && chmod 755 /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mysqld_safe"]