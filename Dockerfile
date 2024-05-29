FROM mysql:8.4.0

ENV MYSQL_ROOT_PASSWORD=ideabd

COPY ./scripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306