"""
Characterisation (pin-down) tests for beedb.models.Audit.

Locks in current behaviour of Audit's fields, defaults, and cascade rules.
Read-only on intent -- the tests do not assert what the behaviour *should*
be, only what it is.

Note: Audit.__str__ accesses self.colony.colonyID directly (no null guard),
so __str__ is only tested when colony is set.
"""

import datetime

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class AuditCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("audit_char_user")
        cls.apiary = models.Apiary.objects.create(
            apiaryID="AuditCharAp", beek=cls.user
        )
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="AuditCharCol"
        )

    # ----- __str__ ---------------------------------------------------------

    def test_str_format_with_colony(self):
        a = models.Audit.objects.create(
            beek=self.user,
            colony=self.colony,
            transaction_cd=1,
        )
        expected = (
            f"Date: {a.dt}, beek: {self.user.username}, "
            f"Col: {self.colony.colonyID}, Tr code: 1 "
        )
        self.assertEqual(str(a), expected)

    # ----- field defaults --------------------------------------------------

    def test_dt_defaults_to_now(self):
        before = timezone.now()
        a = models.Audit.objects.create(beek=self.user)
        after = timezone.now()
        a.refresh_from_db()
        self.assertTrue(before <= a.dt <= after)  # type: ignore

    def test_transaction_cd_defaults_to_zero(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertEqual(a.transaction_cd, 0)

    def test_detail_defaults_to_none(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertIsNone(a.detail)

    def test_apiary_defaults_to_none(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertIsNone(a.apiary)

    def test_colony_defaults_to_none(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertIsNone(a.colony)

    def test_colony1_defaults_to_none(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertIsNone(a.colony1)

    def test_transfer_defaults_to_none(self):
        a = models.Audit.objects.create(beek=self.user)
        a.refresh_from_db()
        self.assertIsNone(a.transfer)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_beek_cascades_to_audit(self):
        user = User.objects.create_user("audit_cascade_user")
        a = models.Audit.objects.create(beek=user)
        self.assertTrue(models.Audit.objects.filter(id=a.id).exists())  # type: ignore
        user.delete()
        self.assertFalse(models.Audit.objects.filter(id=a.id).exists())  # type: ignore

    def test_deleting_apiary_sets_audit_apiary_to_null(self):
        ap = models.Apiary.objects.create(apiaryID="DoomedAuditAp", beek=self.user)
        a = models.Audit.objects.create(beek=self.user, apiary=ap)
        ap.delete()
        a.refresh_from_db()
        self.assertIsNone(a.apiary)

    def test_deleting_colony_sets_audit_colony_to_null(self):
        col = models.Colony.objects.create(
            apiary=self.apiary, colonyID="DoomedAuditCol"
        )
        a = models.Audit.objects.create(beek=self.user, colony=col)
        col.delete()
        a.refresh_from_db()
        self.assertIsNone(a.colony)

    def test_deleting_transfer_sets_audit_transfer_to_null(self):
        t = models.Transfer.objects.create(colony=self.colony)
        a = models.Audit.objects.create(beek=self.user, transfer=t)
        t.delete()
        a.refresh_from_db()
        self.assertIsNone(a.transfer)

    # ----- field metadata --------------------------------------------------

    def test_beek_on_delete_is_cascade(self):
        f = models.Audit._meta.get_field("beek")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_apiary_on_delete_is_set_null(self):
        f = models.Audit._meta.get_field("apiary")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_colony_on_delete_is_set_null(self):
        f = models.Audit._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_transfer_on_delete_is_set_null(self):
        f = models.Audit._meta.get_field("transfer")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_colony1_has_no_reverse_accessor(self):
        # related_name="+" disables the reverse relation
        f = models.Audit._meta.get_field("colony1")
        self.assertEqual(f.remote_field.related_name, "+")  # type: ignore

    # ----- reverse accessors -----------------------------------------------

    def test_user_has_audit_set_reverse_manager(self):
        a = models.Audit.objects.create(beek=self.user)
        self.assertIn(a, list(self.user.audit_set.all()))  # type: ignore

    def test_colony_has_audit_set_reverse_manager(self):
        a = models.Audit.objects.create(beek=self.user, colony=self.colony)
        self.assertIn(a, list(self.colony.audit_set.all()))  # type: ignore
