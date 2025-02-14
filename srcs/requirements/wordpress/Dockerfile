FROM debian:bullseye-slim

RUN apt update
RUN apt install -y wget php7.4-fpm iputils-ping nano \
	php7.4-mysql php7.4-gd php7.4-curl \
	php7.4-mbstring php7.4-xml php7.4-zip curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# これ以降、RUN ADD COPYがこのディレクトリを基準に実行される

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

RUN chmod 755 /usr/local/bin/entrypoint.sh && chown root:root /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]
