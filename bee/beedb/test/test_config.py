"""
Characterisation (pin-down) tests for beedb.models.Config.

Locks in current behaviour of Config's fields and defaults. Read-only on
intent -- the tests do not assert what the behaviour *should* be, only
what it is.
"""

from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class ConfigCharacterisationTests(TestCase):
    serialized_rollback = True

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_key(self):
        c = models.Config.objects.create(key="my_config_key")
        self.assertEqual(str(c), "my_config_key")

    # ----- field defaults --------------------------------------------------

    def test_configDt_defaults_to_none(self):
        c = models.Config.objects.create(key="k")
        c.refresh_from_db()
        self.assertIsNone(c.configDt)

    def test_configValue_defaults_to_none(self):
        c = models.Config.objects.create(key="k")
        c.refresh_from_db()
        self.assertIsNone(c.configValue)

    def test_lastUpdate_defaults_to_now(self):
        before = timezone.now()
        c = models.Config.objects.create(key="k")
        after = timezone.now()
        c.refresh_from_db()
        self.assertTrue(before <= c.lastUpdate <= after)  # type: ignore

    # ----- field metadata --------------------------------------------------

    def test_key_max_length(self):
        self.assertEqual(models.Config._meta.get_field("key").max_length, 500)

    def test_configValue_is_float_field(self):
        f = models.Config._meta.get_field("configValue")
        self.assertIsInstance(f, models.models.FloatField)

    # ----- basic persistence -----------------------------------------------

    def test_config_stores_and_retrieves_value(self):
        c = models.Config.objects.create(key="test_key", configValue=3.14)
        c.refresh_from_db()
        self.assertAlmostEqual(c.configValue, 3.14)  # type: ignore
