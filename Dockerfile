FROM ghcr.io/ch.oereb_base:intermediate as intermediate

FROM postgis/postgis:14-3.3-alpine

RUN rm -rf /docker-entrypoint-initdb.d/*

COPY --from=intermediate /pg_data /var/lib/postgresql/data
