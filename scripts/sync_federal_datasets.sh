#!/bin/bash
set -Eeuo pipefail

federal_themes=(\
    "ch.astra.projektierungszonen-nationalstrassen_v2_0.oereb" \
    # "ch.astra.baulinien-nationalstrassen_v2_0.oereb" \
    "ch.bav.projektierungszonen-eisenbahnanlagen_v2_0.oereb" \
    "ch.bav.baulinien-eisenbahnanlagen_v2_0.oereb" \
    "ch.bazl.projektierungszonen-flughafenanlagen_v2_0.oereb" \
    "ch.bazl.baulinien-flughafenanlagen_v2_0.oereb" \
    "ch.bazl.sicherheitszonenplan_v2_0.oereb" \
    "ch.vbs.kataster-belasteter-standorte-militaer_v2_0.oereb" \
    "ch.bazl.kataster-belasteter-standorte-zivilflugplaetze_v2_0.oereb" \
    "ch.bav.kataster-belasteter-standorte-oev_v2_0.oereb" \
    "ch.bfe.projektierungszonen-starkstromanlagen_v2_0.oereb" \
    "ch.bfe.baulinien-starkstromanlagen_v2_0.oereb"\
)

for theme in "${federal_themes[@]}"; do
  echo "$theme"
  curl -X GET -o /tmp/"$theme".data.zip "$FEDERAL_THEMES_DOWNLOAD_URL"/"$theme"/data.zip
  ls -ls /tmp/"$theme".data.zip
  unzip -o /tmp/"$theme".data.zip '*.xtf' -d /tmp/"$theme"
  mv /tmp/"$theme"/*.xtf ./"$theme".xtf
  git add ./"$theme".xtf
  UPSTREAM_URL="$FEDERAL_THEMES_DOWNLOAD_URL"/"$theme"/data.zip ./scripts/commit_push_if_dirty.sh
done
