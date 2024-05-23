FROM mysql:8.4.0

ENV MYSQL_ROOT_PASSWORD=ideabd

COPY ./script_banco_idea7.sql /docker-entrypoint-initdb.d/

EXPOSE 3306