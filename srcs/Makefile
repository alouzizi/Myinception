
up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose restart

logs:
	docker-compose logs -f

# Clean commands
clean-images:
	docker rmi -f $$(docker images -q)

clean-containers:
	docker rm -f $$(docker ps -aq)

clean-volumes:
	docker volume prune -f

clean: clean-containers clean-images clean-volumes