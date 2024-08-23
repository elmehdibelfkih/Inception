up:
	docker compose -f ./srcs/docker-compose.yml up -d
down:
	docker compose -f ./srcs/docker-compose.yml down
clean: down
	docker system prune -a 
	docker volume prune -f
re: clean up