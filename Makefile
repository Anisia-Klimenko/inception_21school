NAME = inception

SRC = ./srcs/docker-compose.yml

all : ${NAME}

${NAME}:
	mkdir -p ${HOME}/data/db
	mkdir -p ${HOME}/data/wp
	docker-compose -f ${SRC} build --parallel
	docker-compose -f ${SRC} up -d

re : fclean all

stop : 
	docker-compose -f ${SRC} down

clean :
	docker-compose -f ${SRC} down --rmi all

fclean : clean
	sudo rm -rf ${HOME}/data/db/*
	sudo rm -rf ${HOME}/data/wp/*
	docker system prune -f

ps:
	docker-compose -f srcs/docker-compose.yml ps

.PHONY: clean fclean all stop ps

