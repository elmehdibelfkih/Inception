FROM debian:buster


RUN apt update -y && apt upgrade -y && apt install nginx mariadb-client -y
COPY ./conf/nginx.conf /etc/nginx/
COPY ./certs /etc/ssl/certs/
# RUN chown nginx:nginx /etc/ssl/certs/nginx.crt /etc/ssl/certs/nginx.key
RUN chmod 600 /etc/ssl/certs/nginx.crt /etc/ssl/certs/nginx.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
