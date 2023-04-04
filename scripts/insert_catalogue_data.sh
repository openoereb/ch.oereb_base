#!/bin/bash
set -Eeuo pipefail

ili2pg_executable=$(find /tmp/ili2pg -iname 'ili2pg*.jar')
model="OeREBKRM_V2_0;OeREBKRMkvs_V2_0"

for f in ./*.xml; do
  java -jar "$ili2pg_executable" \
    --import \
    --dbdatabase "$POSTGRES_DB" \
    --dbusr gretl \
    --dbport 54321 \
    --dbhost localhost \
    --dbpwd "$PG_GRETL_PWD" \
    --dbschema "$SCHEMA" \
    --models "$model" \
    --dataset "$f" \
    --disableValidation \
    --importBid \
    --importTid \
    --modeldir http://models.interlis.ch/ \
    "$f"
done
