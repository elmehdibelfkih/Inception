FROM debian:latest

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpressuser
ENV MYSQL_PASSWORD=password

# Update the package list and install MariaDB server
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

# Copy the custom MariaDB configuration file if needed (optional)
# COPY my_custom.cnf /etc/mysql/conf.d/

# Copy the initial SQL script to the entrypoint directory
COPY ./conf/init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3305

# Add a script to initialize the database
COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Run the MariaDB service and the initialization script
CMD ["docker-entrypoint.sh"]