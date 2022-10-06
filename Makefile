SRC	= ./srcs/docker-compose.yml

all:
	mkdir -p ${HOME}/data/db
	mkdir -p ${HOME}/data/wp
	docker-compose -f ${SRC} build --parallel
	docker-compose -f ${SRC} up -d

stop:
	docker-compose -f ${SRC} down

clean:
	docker-compose -f ${SRC} down --rmi all

fclean:	clean
	sudo rm -rf ${HOME}/data/db/*
	sudo rm -rf ${HOME}/data/wp/*
	docker system prune -f

ps:
	docker-compose -f ${SRC} ps

re:	fclean all

.PHONY:	all stop clean fclean ps re
