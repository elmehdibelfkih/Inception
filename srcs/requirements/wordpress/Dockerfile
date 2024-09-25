FROM debian:buster
EXPOSE 9000
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install php7.3-fpm php-mysql curl mariadb-client -y
COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x  /usr/local/bin/wordpress.sh
WORKDIR /var/www/html/
ENTRYPOINT ["wordpress.sh"]
CMD ["php-fpm7.3", "--nodaemonize"]