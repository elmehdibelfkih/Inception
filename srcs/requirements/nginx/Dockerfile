FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install nginx mariadb-client -y
COPY ./conf/nginx.conf /etc/nginx/
COPY ./certs /etc/ssl/certs/
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]