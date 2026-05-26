#!/usr/bin/env sh
set -eu

if [ "${DJANGO_DEBUG:-}" = "True" ] || [ "${DJANGO_DEBUG:-}" = "true" ]; then
    echo "DEBUG mode: starting Django development server..."
    exec python manage.py runserver 0.0.0.0:8005
else
    echo "PRODUCTION mode: collecting static files..."
    python manage.py collectstatic --noinput
    echo "PRODUCTION mode: starting Gunicorn..."
    exec gunicorn bee.wsgi:application --bind 0.0.0.0:8005 --workers 3
fi
