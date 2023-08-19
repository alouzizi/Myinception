# Build the Docker image

IMAGE_NAME = mariadb

CONTAINER_NAME = Mymaria
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	docker run -t --env-file ../../.env --name $(CONTAINER_NAME)  $(IMAGE_NAME)

# Stop and remove the Docker container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Clean up Docker images and containers
clean: stop
	docker rmi $(IMAGE_NAME)

# The default target when you run just `make`
default: build run