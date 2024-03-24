RESET	= \033[0m
BLACK 	= \033[1;30m
RED 	= \033[1;31m
GREEN 	= \033[1;32m
YELLOW 	= \033[1;33m
BLUE	= \033[1;34m
PURPLE 	= \033[1;35m
CYAN 	= \033[1;36m
WHITE 	= \033[1;37m

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
	@echo "$--------------------------------$(YELLOW)Containers$(RESET)------------------------------------------------------------------------------------------------"
	@docker ps
	@echo "\n"
	@echo "$----------------------------$(YELLOW)Images$(RESET)---------------------------"
	@docker images -a
	@echo "\n"
	@echo "$--------$(YELLOW)Volumes$(RESET)-------"
	@docker volume ls

remove:
	@sudo rm -rf /home/ioztimur/data/*

logs:
	cd ./srcs && docker-compose logs mariadb wordpress nginx

delete:
	docker system prune -a

login:
	@docker exec -it mariadb bash -c "mysql -u root -p'12345'"

show:
	@docker exec -it mariadb bash -c "mysql -u root -p'12345' -e 'SHOW DATABASES;'"
