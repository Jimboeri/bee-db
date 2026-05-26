"""
Characterisation (pin-down) tests for beedb.models.Transfer.

Locks in current behaviour of Transfer's fields, defaults, cascade rules,
and ordering. Read-only on intent -- the tests do not assert what the
behaviour *should* be, only what it is.
"""

import datetime

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class TransferCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("transfer_char_user")
        cls.apiary = models.Apiary.objects.create(
            apiaryID="TransferCharAp", beek=cls.user
        )
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="TransferCharCol"
        )

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_colony_id(self):
        t = models.Transfer.objects.create(colony=self.colony)
        self.assertEqual(str(t), f"Colony: {self.colony.colonyID}")

    # ----- ordering --------------------------------------------------------

    def test_default_ordering_is_dt_descending(self):
        now = timezone.now()
        old = models.Transfer.objects.create(
            colony=self.colony, dt=now - datetime.timedelta(days=10)
        )
        mid = models.Transfer.objects.create(
            colony=self.colony, dt=now - datetime.timedelta(days=5)
        )
        new = models.Transfer.objects.create(colony=self.colony, dt=now)
        ids = list(
            models.Transfer.objects.filter(colony=self.colony).values_list(
                "id", flat=True
            )
        )
        self.assertEqual(ids, [new.id, mid.id, old.id])

    # ----- field defaults --------------------------------------------------

    def test_dt_defaults_to_now(self):
        before = timezone.now()
        t = models.Transfer.objects.create(colony=self.colony)
        after = timezone.now()
        t.refresh_from_db()
        self.assertTrue(before <= t.dt <= after)  # type: ignore

    def test_outgoing_defaults_to_true(self):
        t = models.Transfer.objects.create(colony=self.colony)
        t.refresh_from_db()
        self.assertIs(t.outgoing, True)

    def test_transaction_defaults_to_zero(self):
        t = models.Transfer.objects.create(colony=self.colony)
        t.refresh_from_db()
        self.assertEqual(t.transaction, 0)

    def test_size_defaults_to_zero(self):
        t = models.Transfer.objects.create(colony=self.colony)
        t.refresh_from_db()
        self.assertEqual(t.size, 0)

    def test_text_fields_default_to_none(self):
        t = models.Transfer.objects.create(colony=self.colony)
        t.refresh_from_db()
        self.assertIsNone(t.beek_name)
        self.assertIsNone(t.beek_registration)
        self.assertIsNone(t.beek_email)
        self.assertIsNone(t.beek_phone)
        self.assertIsNone(t.beek_address)
        self.assertIsNone(t.notes)
        self.assertIsNone(t.location)

    def test_cost_defaults_to_none(self):
        t = models.Transfer.objects.create(colony=self.colony)
        t.refresh_from_db()
        self.assertIsNone(t.cost)

    def test_colony_defaults_to_none_when_not_provided(self):
        t = models.Transfer.objects.create()
        t.refresh_from_db()
        self.assertIsNone(t.colony)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_colony_sets_transfer_colony_to_null(self):
        col = models.Colony.objects.create(
            apiary=self.apiary, colonyID="DoomedTransferCol"
        )
        t = models.Transfer.objects.create(colony=col)
        col.delete()
        t.refresh_from_db()
        self.assertIsNone(t.colony)

    # ----- field metadata --------------------------------------------------

    def test_colony_on_delete_is_set_null(self):
        f = models.Transfer._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_beek_name_max_length(self):
        self.assertEqual(models.Transfer._meta.get_field("beek_name").max_length, 50)

    def test_beek_registration_max_length(self):
        self.assertEqual(
            models.Transfer._meta.get_field("beek_registration").max_length, 50
        )

    def test_beek_phone_max_length(self):
        self.assertEqual(models.Transfer._meta.get_field("beek_phone").max_length, 50)

    def test_beek_email_max_length(self):
        self.assertEqual(models.Transfer._meta.get_field("beek_email").max_length, 50)

    def test_location_max_length(self):
        self.assertEqual(models.Transfer._meta.get_field("location").max_length, 200)

    def test_cost_max_digits_and_decimal_places(self):
        f = models.Transfer._meta.get_field("cost")
        self.assertEqual(f.max_digits, 8)
        self.assertEqual(f.decimal_places, 2)

    # ----- reverse accessor ------------------------------------------------

    def test_colony_has_transfer_set_reverse_manager(self):
        t = models.Transfer.objects.create(colony=self.colony)
        self.assertIn(t, list(self.colony.transfer_set.all()))  # type: ignore
