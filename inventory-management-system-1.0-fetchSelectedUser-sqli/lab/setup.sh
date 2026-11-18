#!/usr/bin/env bash
# Fetch the target application into ./app and wire it to the compose DB service.
# For authorized security research only — the stack binds to 127.0.0.1.
set -e
cd "$(dirname "$0")"

if [ ! -d app ]; then
  echo "[*] cloning target app..."
  git clone --depth 1 https://github.com/stemword/php-inventory-management-system.git app
fi

# point the app's DB config at the compose "db" service
cp app-overrides/php_action/db_connect.php app/php_action/db_connect.php

echo "[+] ready."
echo "    start:   sudo docker-compose up -d --build"
echo "    open:    http://127.0.0.1:8080/"
echo "    poc:     http://127.0.0.1:8080/ + see ../README.md"
