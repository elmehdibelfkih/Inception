FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install php7.3-fpm php-mysql php-xml php-mbstring php-curl curl mariadb-client -y
COPY ./conf/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x  /usr/local/bin/wordpress.sh
EXPOSE 9000 
EXPOSE 3306
CMD wordpress.sh