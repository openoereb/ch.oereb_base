FROM ghcr.io/ch.oereb_base:temp as base

FROM postgis/postgis:14-3.3-alpine

RUN rm -rf /docker-entrypoint-initdb.d/*

COPY --from=base /pg_data /var/lib/postgresql/data
