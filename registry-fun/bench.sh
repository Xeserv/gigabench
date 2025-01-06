#!/usr/bin/env bash

TIGRIS_REG_URL="anu-registry.fly.dev"
R2_REG_URL="r2-registry-production.xe-782.workers.dev"
IMAGE="xe/x/mimi:latest"

set -euo pipefail

skopeo login -u ${TIGRIS_REG_USERNAME} -p ${TIGRIS_REG_PASSWORD} ${TIGRIS_REG_URL} 2>&1 > /dev/null
skopeo login -u ${R2_REG_USERNAME} -p ${R2_REG_PASSWORD} ${R2_REG_URL} 2>&1 > /dev/null

mkdir -p data/{tigris,r2}

echo '---CUT---'
echo 'storage provider,region,iter,time'

for i in {1..1024}; do
  tigris_time="$({ time skopeo copy -q docker://${TIGRIS_REG_URL}/${IMAGE} dir:data/tigris; } 2>&1 | head -n2 | tail -n1 | cut -d$'\t' -f2)"
  echo "tigris,${FLY_REGION},${i},${tigris_time}"

  r2_time="$({ time skopeo copy -q docker://${R2_REG_URL}/${IMAGE} dir:data/r2; } 2>&1 | head -n2 | tail -n1 | cut -d$'\t' -f2)"
  echo "r2,${FLY_REGION},${i},${r2_time}"
done

echo '---CUT---'