FROM debian:buster
EXPOSE 443
RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y
COPY ./conf/nginx.conf /etc/nginx/
COPY ./certs /etc/ssl/certs/
CMD ["nginx", "-g", "daemon off;"]

#khasni n7ot les certificats ssl