all : up

up :
	@docker-compose -f ./srcs/docker-compose.yml up -d

down :
	@docker-compose -f ./srcs/docker-compose.yml down

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start

status :
	@docker ps
	@docker images -a

logs:
	cd ./srcs && docker-compose logs mariadb wordpress nginx
