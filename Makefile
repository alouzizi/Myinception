COMPOSE_FILE = srcs/docker-compose.yml

up:
	docker-compose -f $(COMPOSE_FILE) up

down:
	docker-compose -f $(COMPOSE_FILE) down

build:
	docker-compose -f $(COMPOSE_FILE) build

start:
	docker-compose -f $(COMPOSE_FILE) start

stop:
	docker-compose -f $(COMPOSE_FILE) stop

restart:
	docker-compose -f $(COMPOSE_FILE) restart

logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# Clean commands
clean-images:
	docker rmi -f $$(docker images -q)

clean-containers:
	docker rm -f $$(docker ps -aq)

clean-volumes:
	docker volume rm -f $(docker volume ls -q)

clean: clean-containers clean-images clean-volumes
