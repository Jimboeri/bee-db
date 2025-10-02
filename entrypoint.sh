#!/usr/bin/env sh
set -eu

# Optional: wait for DB (uses pg_isready if available)
#if command -v pg_isready >/dev/null 2>&1; then
#  echo "Waiting for database..."
#  for i in $(seq 1 30); do
#    pg_isready -h "${DB_HOST:-db}" -p "${DB_PORT:-5432}" -U "${DB_USER:-postgres}" && break
#    echo "DB not up yet... ($i)"; sleep 2
#  done
#fi

echo "Applying migrations..."
python manage.py migrate --noinput

echo "Starting background process..."
exec "$@"
