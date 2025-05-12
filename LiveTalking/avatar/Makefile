.PHONY: build up down logs all fclean re console dev start

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

all: build up

fclean: down
	docker-compose rm -f

re: fclean all

console:
	docker-compose run --rm app python agent.py console

dev:
	docker-compose run --rm app python agent.py dev

start:
	docker-compose run --rm app python agent.py start
