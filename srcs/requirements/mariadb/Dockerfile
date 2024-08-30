FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY 50-server.cnf	/etc/mysql/mariadb.conf.d/
COPY script.sh  /
RUN  chmod +x /script.sh

EXPOSE 3306

ENTRYPOINT ["/script.sh"]