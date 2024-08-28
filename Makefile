up:
	unzip -o ./srcs/requirements/wordpress/tools/wordpress-6.6.1.zip -d ./srcs/requirements/wordpress/tools | tail -n 20
	docker compose -f ./srcs/docker-compose.yml up -d
	rm -rf ./srcs/requirements/wordpress/tools/wordpress
down:
	docker compose -f ./srcs/docker-compose.yml down -v
clean: down
	docker system prune -a 
	docker volume prune -f
re: down up
rebuild: clean up
