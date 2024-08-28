FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install php-fpm php-mysql php-xml php-mbstring php-curl -y
COPY ./conf/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x  /usr/local/bin/wordpress.sh
COPY ./tools/wordpress/* /var/www/html/ 
COPY ./conf/wp-config.php /var/www/html/wp-config.php
RUN chown -R www-data:www-data /var/www/html/
RUN find /var/www/html/ -type d -exec chmod 755 {} \;
RUN find /var/www/html/ -type f -exec chmod 644 {} \;
EXPOSE 9000 
EXPOSE 3306
CMD wordpress.sh