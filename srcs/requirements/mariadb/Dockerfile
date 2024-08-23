FROM debian:buster

# Update the package list and install MariaDB server
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server 

# Add a script to initialize the database
COPY ./conf/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Run the MariaDB service and the initialization script 
CMD ["docker-entrypoint.sh"]