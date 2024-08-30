# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: samunyan <samunyan@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/22 16:39:02 by samunyan          #+#    #+#              #
#    Updated: 2023/08/14 15:25:48 by samunyan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all up down re start stop status clean

all:	up

up:
		mkdir -p /home/samunyan/data/wordpress/
		mkdir -p /home/samunyan/data/mariadb/
		docker compose -f ./srcs/docker-compose.yml up --build -d

down:
		docker compose -f ./srcs/docker-compose.yml down

re:		clean up

start:
		docker compose -f ./srcs/docker-compose.yml start

stop:
		docker compose -f ./srcs/docker-compose.yml stop

status:
		docker compose ps

clean:	down
		docker system prune -af
		docker volume rm $(shell docker volume ls -q)
		sudo rm -rf /home/samunyan/data/
