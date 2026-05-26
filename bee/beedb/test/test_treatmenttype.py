"""
Characterisation (pin-down) tests for beedb.models.TreatmentType.

Locks in current behaviour of TreatmentType's fields and defaults.
Read-only on intent -- the tests do not assert what the behaviour
*should* be, only what it is.
"""

from django.test import TestCase  # type: ignore

from beedb import models


class TreatmentTypeCharacterisationTests(TestCase):
    serialized_rollback = True

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_name(self):
        tt = models.TreatmentType.objects.create(
            name="Apivar", manufacturer="Whitmire", description="d", instructions="i"
        )
        self.assertEqual(str(tt), "Apivar")

    # ----- field defaults --------------------------------------------------

    def test_organic_defaults_to_false(self):
        tt = models.TreatmentType.objects.create(
            name="t", manufacturer="m", description="d", instructions="i"
        )
        tt.refresh_from_db()
        self.assertIs(tt.organic, False)

    def test_requireRemoval_defaults_to_false(self):
        tt = models.TreatmentType.objects.create(
            name="t", manufacturer="m", description="d", instructions="i"
        )
        tt.refresh_from_db()
        self.assertIs(tt.requireRemoval, False)

    def test_daysInHive_defaults_to_none(self):
        tt = models.TreatmentType.objects.create(
            name="t", manufacturer="m", description="d", instructions="i"
        )
        tt.refresh_from_db()
        self.assertIsNone(tt.daysInHive)

    def test_url_defaults_to_none(self):
        tt = models.TreatmentType.objects.create(
            name="t", manufacturer="m", description="d", instructions="i"
        )
        tt.refresh_from_db()
        self.assertIsNone(tt.url)

    # ----- field metadata --------------------------------------------------

    def test_name_max_length(self):
        self.assertEqual(models.TreatmentType._meta.get_field("name").max_length, 100)

    def test_manufacturer_max_length(self):
        self.assertEqual(
            models.TreatmentType._meta.get_field("manufacturer").max_length, 100
        )

    # ----- reverse accessor ------------------------------------------------

    def test_treatmenttype_has_treatment_set_reverse_manager(self):
        user = models.User.objects.create_user("tt_reverse_user")
        ap = models.Apiary.objects.create(apiaryID="TTRevAp", beek=user)
        col = models.Colony.objects.create(apiary=ap, colonyID="TTRevCol")
        tt = models.TreatmentType.objects.create(
            name="t", manufacturer="m", description="d", instructions="i"
        )
        tr = models.Treatment.objects.create(treatmentType=tt, colony=col)
        self.assertIn(tr, list(tt.treatment_set.all()))  # type: ignore
