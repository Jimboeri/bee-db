# Database
## Creating fixtures

```docker compose run web python manage.py dumpdata >> bee/beedb/fixtures/filename.json```

**NB the files chould be stored in the fixtures folder**

## Running the test suite
```docker compose run web python manage.py test```

**NB The test file should be in the tests folder**

## Changing javascript

It is necessary to 'hard reset' Firefox. to do so press
```ctrl F5```

