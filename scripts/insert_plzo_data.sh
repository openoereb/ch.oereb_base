#!/bin/bash
set -Eeuo pipefail

ili2pg_executable=$(find /tmp/ili2pg -iname 'ili2pg*.jar')
model="PLZOCH1LV95D"
dataset="PLZO_INTERLIS_LV95"
FILE_NAME="PLZO_ITF_LV95"

unzip -o ./"$dataset".zip '*.itf' -d ./

java -jar "$ili2pg_executable" \
  --import \
  --dbdatabase "$POSTGRES_DB" \
  --dbusr gretl \
  --dbport 54321 \
  --dbhost localhost \
  --dbpwd "$PG_GRETL_PWD" \
  --dbschema "$SCHEMA" \
  --dataset "$dataset" \
  --disableValidation \
  --models "$model" \
  --verbose \
  ./"$dataset"/"$FILE_NAME".itf
