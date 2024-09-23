FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install php7.3-fpm php-mysql curl mariadb-client -y
COPY ./conf/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x  /usr/local/bin/wordpress.sh
WORKDIR /var/www/html/
EXPOSE 9000 
CMD wordpress.sh