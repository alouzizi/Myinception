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

