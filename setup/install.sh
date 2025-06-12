#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Install Docker if not present
if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com | sh
fi

# Install docker-compose if not present
if ! command -v docker-compose >/dev/null 2>&1; then
  apt-get update
  apt-get install -y docker-compose
fi

# Create persistent directories
mkdir -p "$PROJECT_ROOT/docker/etc-pihole" "$PROJECT_ROOT/docker/etc-dnsmasq.d" "$PROJECT_ROOT/backups"

# Start Pi-hole container
cd "$PROJECT_ROOT/docker"
docker-compose up -d
