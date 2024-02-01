DOCKER = docker compose -f docker-compose.yml
DATA_FOLDER = /Users/afrigger/data

all:
	clear
	$(DOCKER) up -d --build

clean:
	clear
	docker image prune -a
	$(DOCKER) down

fclean: clean
	docker system prune -a --volumes

re : fclean all

list:
	clear
	docker ps -a
	docker images ls
	docker network ls
	docker volume ls

.PHONY: all re fclean clean list