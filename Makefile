up:
	mkdir -p /home/ebelfkih/data/wordpress
	mkdir -p /home/ebelfkih/data/mariadb
	if [ ! -f "/home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.key" ] \
	|| [ ! -f "/home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.crt" ]; then \
		make ssl; \
	fi
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose -f ./srcs/docker-compose.yml build
down:
	docker compose -f ./srcs/docker-compose.yml down

status:
	docker compose -f ./srcs/docker-compose.yml ps

clean: down
	docker image prune -af
	docker volume prune -f
	docker network prune -f

fclean: clean
	docker volume rm wordpress mariadb
	sudo rm -rf /home/ebelfkih/data/wordpress
	sudo rm -rf /home/ebelfkih/data/mariadb
	rm -rf /home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.key
	rm -rf /home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.crt

re: clean up

ssl:
	openssl req -x509 -nodes -newkey rsa:2048 -keyout \
	/home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.key \
	-out /home/ebelfkih/Desktop/Inception/srcs/requirements/nginx/certs/nginx.crt \
	-days 365 -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"
