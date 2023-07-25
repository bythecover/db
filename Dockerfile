FROM postgres:15.3

ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres_admin
ENV POSTGRES_PASSWORD=password

COPY ./data/* /docker-entrypoint-initdb.d/
COPY ./scripts/* /docker-entrypoint-initdb.d/

EXPOSE 5432