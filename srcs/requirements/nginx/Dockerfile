FROM debian:latest


RUN apt update -y && apt upgrade -y && apt install nginx -y
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY certs /etc/nginx/certs
WORKDIR /tools
COPY tools/. .
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
