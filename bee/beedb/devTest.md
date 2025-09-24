#Testing and development notes
#Testing

##Database stuff
Log into database shell (can be in portainer), then run
psql -U postgres

### To dump data to a 'fixture'
python manage.py dumpdata > file.name

