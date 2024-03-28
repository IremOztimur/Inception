# -f: --file
# -q: --quiet
# -a: --all
# $$: escape $ for shell

RESET	= \033[0m
BLACK 	= \033[1;30m
RED 	= \033[1;31m
GREEN 	= \033[1;32m
YELLOW 	= \033[1;33m
BLUE	= \033[1;34m
PURPLE 	= \033[1;35m
CYAN 	= \033[1;36m
WHITE 	= \033[1;37m

all:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@sudo rm -fr $(HOME)/data/wordpress
	@sudo rm -fr $(HOME)/data/mariadb

status :
	@echo "$--------------------------------$(YELLOW)Containers$(RESET)------------------------------------------------------------------------------------------------"
	@docker ps
	@echo "\n"
	@echo "$----------------------------$(YELLOW)Images$(RESET)---------------------------"
	@docker images -a
	@echo "\n"
	@echo "$--------$(YELLOW)Volumes$(RESET)-------"
	@docker volume ls

login:
	@docker exec -it mariadb bash -c "mysql -u root -p'root12345'"

show:
	@docker exec -it mariadb bash -c "mysql -u root -p'root12345' -e 'SHOW DATABASES;'"

logs:
	cd ./srcs && docker-compose logs mariadb wordpress nginx

delete:
	@docker system prune -a
	@docker volume prune -f

.PHONY: all re down clean
