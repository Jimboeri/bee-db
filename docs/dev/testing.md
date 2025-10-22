# TESTING

## Running the test suite
```docker compose run --remove-orphans web python manage.py test```

**NB The test file should be in the tests folder**

## Changing javascript

It is necessary to 'hard reset' Firefox. to do so press
```ctrl F5```

## Pre-loading test data
The fixture containing the test data is stored in the fixture folder. It is pre-loaded before tests by the runner.py script. 
This is pointed to in settings.py, the TEST_RUNNER parameter.

* Need to work out if I must update other settings file!