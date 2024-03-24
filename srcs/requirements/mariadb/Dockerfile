FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

EXPOSE 3306

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

CMD ["bash", "/script.sh"]
