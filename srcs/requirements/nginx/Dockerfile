FROM debian:buster


RUN apt update -y && apt upgrade -y && apt install nginx -y
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY certs /etc/nginx/certs
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
