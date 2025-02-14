FROM debian:bullseye

RUN apt update;
RUN apt install -y vim
RUN apt install -y nginx

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./ssl /etc/nginx/ssl

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

EXPOSE 443