# core/tests/runner.py  (any module on your PYTHONPATH is fine)
from django.core.management import call_command
from django.test.runner import DiscoverRunner
from django.db import connections


class FixtureOnceRunner(DiscoverRunner):
    # names without path if they’re in app fixtures or FIXTURE_DIRS
    preload_fixtures = ("fixture3.json",)

    def setup_databases(self, **kwargs):
        db_cfg = super().setup_databases(**kwargs)
        # Load into each test DB (important if you use multiple DBs or parallel tests)
        for alias in connections:
            for fx in self.preload_fixtures:
                call_command("loaddata", fx, database=alias, verbosity=0)
        return db_cfg
