FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y
EXPOSE 3306
COPY ./conf/mariaDB.sh /usr/local/bin/mariaDB.sh
RUN chmod +x /usr/local/bin/mariaDB.sh
CMD ["mariaDB.sh"]