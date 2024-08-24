FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install php-fpm php-mysql php-xml php-mbstring php-curl -y
COPY ./conf/set.sh /usr/local/bin/
RUN chmod +x  /usr/local/bin/set.sh
COPY ./tools/wordpress/* /var/www/html/ 
COPY ./conf/wp-config.php /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
RUN find /var/www/html/ -type d -exec chmod 755 {} \;
RUN find /var/www/html/ -type f -exec chmod 644 {} \;
EXPOSE 80 
EXPOSE 443
EXPOSE 3306
CMD set.sh