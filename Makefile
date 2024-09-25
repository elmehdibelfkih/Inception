up:
	mkdir -p /home/ebelfkih/data/wordpress
	mkdir -p /home/ebelfkih/data/mariadb
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

re: clean up

