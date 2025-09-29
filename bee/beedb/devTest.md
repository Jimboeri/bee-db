#Testing and development notes
## Testing
To run a test from the terminal
docker compose run --rm web python manage.py test

## Database stuff
Log into database shell (can be in portainer), then run
psql -U postgres

### To dump data to a 'fixture'
python manage.py dumpdata > file.name

