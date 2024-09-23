FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y
COPY ./conf/nginx.conf /etc/nginx/
COPY ./certs /etc/ssl/certs/
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]