FROM postgres:15.3

ENV POSTGRES_PASSWORD=password
ENV POSTGRES_USER=postgres_admin
ENV POSTGRES_DB=postgres

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432