#!/bin/bash
set -Eeuo pipefail

curl -o /tmp/ili2pg-$ILI2PG_VERSION.zip https://downloads.interlis.ch/ili2pg/ili2pg-${ILI2PG_VERSION}.zip
rm -rf /tmp/ili2pg
mkdir /tmp/ili2pg
unzip -d /tmp/ili2pg /tmp/ili2pg-${ILI2PG_VERSION}.zip
chmod -R ogu+rwx /tmp/ili2pg/*
