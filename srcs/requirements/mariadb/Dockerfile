FROM debian:buster
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server 
COPY ./conf/mariaDB.sh /usr/local/bin/mariaDB.sh
RUN chmod +x /usr/local/bin/mariaDB.sh
EXPOSE 3306
# CMD mariaDB.sh
CMD ["tail", "-f", "/dev/null"]