up:
	docker compose -f ./srcs/docker-compose.yml up &
down:
	docker compose -f ./srcs/docker-compose.yml down
clean: down
	docker image prune -a 
	docker volume prune -f
	docker volume rm $(docker volume ls -q)
	docker network prune -f
	docker network rm $(docker network ls -q)
re: down up
rebuild: clean up
