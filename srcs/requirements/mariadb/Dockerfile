FROM debian:buster
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server 
COPY ./conf/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD ["docker-entrypoint.sh"]