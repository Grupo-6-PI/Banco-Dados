FROM mysql:8

COPY creations.sql /docker-entrypoint-initdb.d/
COPY insertions.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
