up:
	docker compose -f ./srcs/docker-compose.yml up &
down:
	docker compose -f ./srcs/docker-compose.yml down
clean: down
	docker system prune -a 
	docker volume prune -f
re: down up
rebuild: clean up
