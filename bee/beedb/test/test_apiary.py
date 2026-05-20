"""
Characterisation (pin-down) tests for beedb.models.Apiary.

These lock in the model's current observable behaviour so refactors
can't change it accidentally. They are not assertions about what the
behaviour *should* be -- only what it currently is.
"""

from decimal import Decimal

from django.contrib.auth.models import User  # type: ignore
from django.db import IntegrityError, transaction  # type: ignore
from django.test import TestCase  # type: ignore

from beedb import models


class ApiaryCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("ap_char_user")

    # ----- __str__ and ordering ---------------------------------------

    def test_str_returns_apiaryID(self):
        ap = models.Apiary.objects.create(apiaryID="Home", beek=self.user)
        self.assertEqual(str(ap), "Home")

    def test_default_ordering_is_apiaryID_ascending(self):
        for name in ("Charlie", "Alpha", "Bravo"):
            models.Apiary.objects.create(apiaryID=name, beek=self.user)

        ids = list(
            models.Apiary.objects.filter(beek=self.user).values_list(
                "apiaryID", flat=True
            )
        )
        self.assertEqual(ids, ["Alpha", "Bravo", "Charlie"])

    # ----- field defaults & nullability -------------------------------

    def test_lat_long_default_to_zero(self):
        ap = models.Apiary.objects.create(apiaryID="A", beek=self.user)
        ap.refresh_from_db()
        self.assertEqual(ap.latitude, Decimal("0"))
        self.assertEqual(ap.longitude, Decimal("0"))

    def test_optional_text_fields_default_to_none(self):
        ap = models.Apiary.objects.create(apiaryID="A", beek=self.user)
        ap.refresh_from_db()
        for field in (
            "descr",
            "ownerResident",
            "residentPhone",
            "address",
            "location",
            "hazards",
        ):
            self.assertIsNone(getattr(ap, field), f"{field} should default to None")

    # ----- cascade behaviour ------------------------------------------

    def test_deleting_user_cascades_to_apiary(self):
        u = User.objects.create_user("ap_char_doomed")
        models.Apiary.objects.create(apiaryID="A1", beek=u)
        models.Apiary.objects.create(apiaryID="A2", beek=u)
        self.assertEqual(models.Apiary.objects.filter(beek=u).count(), 2)
        u.delete()
        self.assertEqual(
            models.Apiary.objects.filter(apiaryID__in=["A1", "A2"]).count(), 0
        )

    def test_deleting_apiary_cascades_to_colony(self):
        ap = models.Apiary.objects.create(apiaryID="Forge", beek=self.user)
        models.Colony.objects.create(apiary=ap, colonyID="C1")
        models.Colony.objects.create(apiary=ap, colonyID="C2")
        ap.delete()
        self.assertFalse(
            models.Colony.objects.filter(colonyID__in=["C1", "C2"]).exists()
        )

    # ----- required fields --------------------------------------------

    def test_beek_is_required_at_db_level(self):
        ap = models.Apiary(apiaryID="Orphan")
        with self.assertRaises(IntegrityError):
            with transaction.atomic():
                ap.save()

    # ----- field metadata ---------------------------------------------

    def test_ownerResident_verbose_name(self):
        f = models.Apiary._meta.get_field("ownerResident")
        self.assertEqual(f.verbose_name, "Name of owner / occupier")

    def test_apiaryID_max_length_is_50(self):
        f = models.Apiary._meta.get_field("apiaryID")
        self.assertEqual(f.max_length, 50)

    def test_lat_long_decimal_precision(self):
        for name in ("latitude", "longitude"):
            f = models.Apiary._meta.get_field(name)
            self.assertEqual(f.max_digits, 12)
            self.assertEqual(f.decimal_places, 7)

    def test_beek_on_delete_is_cascade(self):
        f = models.Apiary._meta.get_field("beek")
        # on_delete is stored as a callable; compare via models.CASCADE
        from django.db import models as djmodels  # type: ignore

        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)

    # ----- reverse relation -------------------------------------------

    def test_user_has_apiary_set_reverse_manager(self):
        self.assertTrue(hasattr(self.user, "apiary_set"))
        ap = models.Apiary.objects.create(apiaryID="Rev", beek=self.user)
        self.assertIn(ap, list(self.user.apiary_set.all()))
