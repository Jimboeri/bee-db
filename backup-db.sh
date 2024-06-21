#/bin/bash

cd /home/jim/docker/bee-db

docker exec bee-db-bee-db-1 pg_dump -d postgres -U postgres -f /backup/postgres-db.sql

