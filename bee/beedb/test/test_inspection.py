"""
Characterisation (pin-down) tests for beedb.models.Inspection.

Locks in current behaviour of Inspection's fields, defaults, cascade rules,
ordering, choice-display helpers, and healthScore(). Read-only on intent --
the tests do not assert what the behaviour *should* be, only what it is.

SizeChoice rows are available because FixtureOnceRunner pre-loads fixture3.json
into the test database before any tests run.
"""

import datetime

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class InspectionCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("insp_char_user")
        cls.apiary = models.Apiary.objects.create(apiaryID="InspCharAp", beek=cls.user)
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="InspCharCol"
        )

    # ----- __str__ ---------------------------------------------------------

    def test_str_format(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        expected = (
            f"Date: {insp.dt}, Colony: {self.colony.colonyID}, "
            f"health: {insp.healthScore():.1f}"
        )
        self.assertEqual(str(insp), expected)

    # ----- ordering --------------------------------------------------------

    def test_default_ordering_is_dt_descending(self):
        now = timezone.now()
        old = models.Inspection.objects.create(
            colony=self.colony, dt=now - datetime.timedelta(days=10)
        )
        mid = models.Inspection.objects.create(
            colony=self.colony, dt=now - datetime.timedelta(days=5)
        )
        new = models.Inspection.objects.create(colony=self.colony, dt=now)
        ids = list(
            models.Inspection.objects.filter(colony=self.colony).values_list(
                "id", flat=True
            )
        )
        self.assertEqual(ids, [new.id, mid.id, old.id])

    # ----- field defaults --------------------------------------------------

    def test_dt_defaults_to_now(self):
        before = timezone.now()
        insp = models.Inspection.objects.create(colony=self.colony)
        after = timezone.now()
        insp.refresh_from_db()
        self.assertTrue(before <= insp.dt <= after)  # type: ignore

    def test_notes_defaults_to_none(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertIsNone(insp.notes)

    def test_numbers_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.numbers, 0)

    def test_eggs_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.eggs, 0)

    def test_varroa_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.varroa, 0)

    def test_weight_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.weight, 0)

    def test_disease_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.disease, 0)

    def test_temper_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.temper, 0)

    def test_broodFrames_defaults_to_zero(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertEqual(insp.broodFrames, 0)

    def test_queen_seen_defaults_to_false(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertIs(insp.queen_seen, False)

    def test_size_defaults_to_none(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        insp.refresh_from_db()
        self.assertIsNone(insp.size)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_colony_cascades_to_inspection(self):
        col = models.Colony.objects.create(apiary=self.apiary, colonyID="DoomedInspCol")
        insp = models.Inspection.objects.create(colony=col)
        self.assertTrue(models.Inspection.objects.filter(id=insp.id).exists())  # type: ignore
        col.delete()
        self.assertFalse(models.Inspection.objects.filter(id=insp.id).exists())  # type: ignore

    # ----- varroaChoiceDisplay() -------------------------------------------

    def test_varroaChoiceDisplay_returns_label_for_known_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, varroa=2)
        self.assertEqual(insp.varroaChoiceDisplay(), "1 - 2 varroa / 300 bees")

    def test_varroaChoiceDisplay_returns_question_mark_for_unknown_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, varroa=99)
        self.assertEqual(insp.varroaChoiceDisplay(), "?")

    def test_varroaChoiceDisplay_zero_returns_not_recorded(self):
        insp = models.Inspection.objects.create(colony=self.colony, varroa=0)
        self.assertEqual(insp.varroaChoiceDisplay(), "Not recorded")

    # ----- eggChoiceDisplay() ----------------------------------------------

    def test_eggChoiceDisplay_returns_label_for_known_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, eggs=2)
        self.assertEqual(
            insp.eggChoiceDisplay(), "Lots of eggs & larvae, but spotty brood"
        )

    def test_eggChoiceDisplay_returns_question_mark_for_unknown_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, eggs=99)
        self.assertEqual(insp.eggChoiceDisplay(), "?")

    def test_eggChoiceDisplay_zero_returns_not_recorded(self):
        insp = models.Inspection.objects.create(colony=self.colony, eggs=0)
        self.assertEqual(insp.eggChoiceDisplay(), "Not recorded")

    # ----- diseaseChoiceDisplay() ------------------------------------------

    def test_diseaseChoiceDisplay_returns_label_for_known_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, disease=3)
        self.assertEqual(insp.diseaseChoiceDisplay(), "Some disease")

    def test_diseaseChoiceDisplay_returns_question_mark_for_unknown_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, disease=99)
        self.assertEqual(insp.diseaseChoiceDisplay(), "?")

    def test_diseaseChoiceDisplay_zero_returns_not_recorded(self):
        insp = models.Inspection.objects.create(colony=self.colony, disease=0)
        self.assertEqual(insp.diseaseChoiceDisplay(), "Not recorded")

    # ----- temperChoiceDisplay() -------------------------------------------

    def test_temperChoiceDisplay_returns_label_for_known_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, temper=3)
        self.assertEqual(insp.temperChoiceDisplay(), "Bees a bit defensive")

    def test_temperChoiceDisplay_returns_question_mark_for_unknown_value(self):
        insp = models.Inspection.objects.create(colony=self.colony, temper=99)
        self.assertEqual(insp.temperChoiceDisplay(), "?")

    def test_temperChoiceDisplay_zero_returns_not_recorded(self):
        insp = models.Inspection.objects.create(colony=self.colony, temper=0)
        self.assertEqual(insp.temperChoiceDisplay(), "Not recorded")

    # ----- numChoiceDisplay() (SizeChoice lookup) --------------------------

    def test_numChoiceDisplay_returns_text_for_matching_sizechoice(self):
        # fixture3.json: size=1, type="Number", value=2 → "Good bee numbers"
        insp = models.Inspection.objects.create(colony=self.colony, size=1, numbers=2)
        self.assertEqual(insp.numChoiceDisplay(), "Good bee numbers")

    def test_numChoiceDisplay_returns_space_when_no_match(self):
        insp = models.Inspection.objects.create(colony=self.colony, size=99, numbers=99)
        self.assertEqual(insp.numChoiceDisplay(), " ")

    # ----- weightChoiceDisplay() (SizeChoice lookup) -----------------------

    def test_weightChoiceDisplay_returns_text_for_matching_sizechoice(self):
        # fixture3.json: size=1, type="Weight", value=2 → look up the actual text
        sc = models.SizeChoice.objects.get(size=1, type="Weight", value=2)
        insp = models.Inspection.objects.create(colony=self.colony, size=1, weight=2)
        self.assertEqual(insp.weightChoiceDisplay(), sc.text)

    def test_weightChoiceDisplay_returns_space_when_no_match(self):
        insp = models.Inspection.objects.create(colony=self.colony, size=99, weight=99)
        self.assertEqual(insp.weightChoiceDisplay(), " ")

    # ----- healthScore() ---------------------------------------------------

    def test_healthScore_all_zeros_returns_zero(self):
        # All fields 0: only varroa else-branch fires (nPoss=1, nScore=0)
        insp = models.Inspection.objects.create(colony=self.colony)
        self.assertAlmostEqual(insp.healthScore(), 0.0)

    def test_healthScore_varroa_only(self):
        # varroa=1: nPoss=10, nScore=11-2=9 → 90.0
        insp = models.Inspection.objects.create(colony=self.colony, varroa=1)
        self.assertAlmostEqual(insp.healthScore(), 90.0)

    def test_healthScore_eggs_and_varroa(self):
        # eggs=1: nPoss+=5, nScore+=5
        # varroa=1: nPoss+=10, nScore+=9
        # total: nPoss=15, nScore=14 → 93.333...
        insp = models.Inspection.objects.create(colony=self.colony, eggs=1, varroa=1)
        self.assertAlmostEqual(insp.healthScore(), 14 / 15 * 100)

    def test_healthScore_worst_values(self):
        # numbers=5: nPoss+=5, nScore+=1
        # eggs=5: nPoss+=5, nScore+=1
        # varroa=5: nPoss+=10, nScore+=1
        # weight=5: nPoss+=5, nScore+=1
        # disease=5: nPoss+=3, nScore+=-1
        # temper=5: nPoss+=3, nScore+=-1
        # total: nPoss=31, nScore=2 → 2/31*100
        insp = models.Inspection.objects.create(
            colony=self.colony,
            numbers=5,
            eggs=5,
            varroa=5,
            weight=5,
            disease=5,
            temper=5,
        )
        self.assertAlmostEqual(insp.healthScore(), 2 / 31 * 100)

    # ----- field metadata --------------------------------------------------

    def test_colony_on_delete_is_cascade(self):
        f = models.Inspection._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_eggs_choices_match(self):
        from beedb.models import EGG_CHOICES

        f = models.Inspection._meta.get_field("eggs")
        self.assertEqual(list(f.choices), list(EGG_CHOICES))  # type: ignore

    def test_varroa_choices_match(self):
        from beedb.models import VARROA_CHOICES

        f = models.Inspection._meta.get_field("varroa")
        self.assertEqual(list(f.choices), list(VARROA_CHOICES))  # type: ignore

    def test_disease_choices_match(self):
        from beedb.models import DISEASE_CHOICES

        f = models.Inspection._meta.get_field("disease")
        self.assertEqual(list(f.choices), list(DISEASE_CHOICES))  # type: ignore

    def test_temper_choices_match(self):
        from beedb.models import TEMPER_CHOICES

        f = models.Inspection._meta.get_field("temper")
        self.assertEqual(list(f.choices), list(TEMPER_CHOICES))  # type: ignore

    # ----- reverse accessor ------------------------------------------------

    def test_colony_has_inspection_set_reverse_manager(self):
        insp = models.Inspection.objects.create(colony=self.colony)
        self.assertIn(insp, list(self.colony.inspection_set.all()))  # type: ignore
