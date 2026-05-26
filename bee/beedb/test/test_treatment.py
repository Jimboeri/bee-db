"""
Characterisation (pin-down) tests for beedb.models.Treatment.

Locks in current behaviour of Treatment's fields, defaults, cascade rules,
and choice-display helpers. Read-only on intent -- the tests do not assert
what the behaviour *should* be, only what it is.
"""

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class TreatmentCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("treatment_char_user")
        cls.apiary = models.Apiary.objects.create(
            apiaryID="TreatmentCharAp", beek=cls.user
        )
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="TreatmentCharCol"
        )
        cls.treatment_type = models.TreatmentType.objects.create(
            name="Apivar",
            manufacturer="Whitmire",
            description="Amitraz strips",
            instructions="Apply between frames",
        )

    def _make_treatment(self, **kwargs):
        defaults = {"treatmentType": self.treatment_type, "colony": self.colony}
        defaults.update(kwargs)
        return models.Treatment.objects.create(**defaults)

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_treatment_name_and_colony(self):
        t = self._make_treatment()
        self.assertEqual(
            str(t),
            f"{self.treatment_type.name} in {self.colony.colonyID}",
        )

    # ----- field defaults --------------------------------------------------

    def test_completed_defaults_to_false(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertIs(t.completed, False)

    def test_insertDt_defaults_to_now(self):
        before = timezone.now()
        t = self._make_treatment()
        after = timezone.now()
        t.refresh_from_db()
        self.assertTrue(before <= t.insertDt <= after)  # type: ignore

    def test_removeDt_defaults_to_none(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertIsNone(t.removeDt)

    def test_trNotes_defaults_to_none(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertIsNone(t.trNotes)

    def test_inspection_defaults_to_none(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertIsNone(t.inspection)

    def test_preVarroa_defaults_to_zero(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertEqual(t.preVarroa, 0)

    def test_postVarroa_defaults_to_zero(self):
        t = self._make_treatment()
        t.refresh_from_db()
        self.assertEqual(t.postVarroa, 0)

    # ----- preVarroaChoiceDisplay() ----------------------------------------

    def test_preVarroaChoiceDisplay_returns_label_for_known_value(self):
        t = self._make_treatment(preVarroa=2)
        self.assertEqual(t.preVarroaChoiceDisplay(), "1 - 2 varroa / 300 bees")

    def test_preVarroaChoiceDisplay_zero_returns_not_recorded(self):
        t = self._make_treatment(preVarroa=0)
        self.assertEqual(t.preVarroaChoiceDisplay(), "Not recorded")

    def test_preVarroaChoiceDisplay_unknown_returns_question_mark(self):
        t = self._make_treatment(preVarroa=99)
        self.assertEqual(t.preVarroaChoiceDisplay(), "?")

    # ----- postVarroaChoiceDisplay() ---------------------------------------

    def test_postVarroaChoiceDisplay_returns_label_for_known_value(self):
        t = self._make_treatment(postVarroa=3)
        self.assertEqual(t.postVarroaChoiceDisplay(), "3 - 6 varroa / 300 bees")

    def test_postVarroaChoiceDisplay_zero_returns_not_recorded(self):
        t = self._make_treatment(postVarroa=0)
        self.assertEqual(t.postVarroaChoiceDisplay(), "Not recorded")

    def test_postVarroaChoiceDisplay_unknown_returns_question_mark(self):
        t = self._make_treatment(postVarroa=99)
        self.assertEqual(t.postVarroaChoiceDisplay(), "?")

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_treatmentType_cascades_to_treatment(self):
        tt = models.TreatmentType.objects.create(
            name="Doomed", manufacturer="m", description="d", instructions="i"
        )
        t = self._make_treatment(treatmentType=tt)
        self.assertTrue(models.Treatment.objects.filter(id=t.id).exists())  # type: ignore
        tt.delete()
        self.assertFalse(models.Treatment.objects.filter(id=t.id).exists())  # type: ignore

    def test_deleting_colony_cascades_to_treatment(self):
        col = models.Colony.objects.create(
            apiary=self.apiary, colonyID="DoomedTreatCol"
        )
        t = self._make_treatment(colony=col)
        self.assertTrue(models.Treatment.objects.filter(id=t.id).exists())  # type: ignore
        col.delete()
        self.assertFalse(models.Treatment.objects.filter(id=t.id).exists())  # type: ignore

    def test_deleting_inspection_sets_treatment_inspection_to_null(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        t = self._make_treatment(inspection=insp)
        insp.delete()
        t.refresh_from_db()
        self.assertIsNone(t.inspection)

    # ----- field metadata --------------------------------------------------

    def test_treatmentType_on_delete_is_cascade(self):
        f = models.Treatment._meta.get_field("treatmentType")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_colony_on_delete_is_cascade(self):
        f = models.Treatment._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_inspection_on_delete_is_set_null(self):
        f = models.Treatment._meta.get_field("inspection")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_completed_verbose_name(self):
        f = models.Treatment._meta.get_field("completed")
        self.assertEqual(f.verbose_name, "Treatment completed & removed")

    def test_insertDt_verbose_name(self):
        f = models.Treatment._meta.get_field("insertDt")
        self.assertEqual(f.verbose_name, "Date treatment put in")

    def test_removeDt_verbose_name(self):
        f = models.Treatment._meta.get_field("removeDt")
        self.assertEqual(f.verbose_name, "Date treatment to be removed")

    def test_preVarroa_choices_match(self):
        from beedb.models import VARROA_CHOICES
        f = models.Treatment._meta.get_field("preVarroa")
        self.assertEqual(list(f.choices), list(VARROA_CHOICES))  # type: ignore

    def test_postVarroa_choices_match(self):
        from beedb.models import VARROA_CHOICES
        f = models.Treatment._meta.get_field("postVarroa")
        self.assertEqual(list(f.choices), list(VARROA_CHOICES))  # type: ignore

    # ----- reverse accessor ------------------------------------------------

    def test_colony_has_treatment_set_reverse_manager(self):
        t = self._make_treatment()
        self.assertIn(t, list(self.colony.treatment_set.all()))  # type: ignore
