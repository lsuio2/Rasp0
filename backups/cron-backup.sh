#!/bin/bash

BACKUP_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/pihole_backup_$TIMESTAMP.tar.gz"

# Check if Pi-hole container is running
if docker ps --format '{{.Names}}' | grep -q '^pihole$'; then
  docker exec pihole tar czf - /etc/pihole /etc/dnsmasq.d > "$BACKUP_FILE"
else
  echo "Pi-hole container is not running. Backup skipped." >&2
  exit 1
fi
