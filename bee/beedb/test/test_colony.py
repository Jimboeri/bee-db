"""
Characterisation (pin-down) tests for beedb.models.Colony.

Locks in current behaviour of Colony's fields, defaults, cascade rules,
choice mappings, and its four helper methods: lastInspection,
statusDisplay, diaryDue, diaryDueNew. Read-only on intent -- the tests
do not assert what the behaviour *should* be, only what it is.
"""

import datetime

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class ColonyCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("col_char_user")
        cls.apiary = models.Apiary.objects.create(apiaryID="ColCharAp", beek=cls.user)

    # ----- helpers -----------------------------------------------------

    def _make_diary(self, colony, due_offset_days, completed=False, notified=False):
        return models.Diary.objects.create(
            beek=self.user,
            colony=colony,
            apiary=colony.apiary,
            dueDt=timezone.now() + datetime.timedelta(days=due_offset_days),
            notifyDt=timezone.now() if notified else None,
            completed=completed,
        )

    # ----- __str__ and ordering ----------------------------------------

    def test_str_returns_colonyID(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="Hive1")
        self.assertEqual(str(c), "Hive1")

    def test_default_ordering_is_colonyID_ascending(self):
        for cid in ("Charlie", "Alpha", "Bravo"):
            models.Colony.objects.create(apiary=self.apiary, colonyID=cid)
        ids = list(
            models.Colony.objects.filter(apiary=self.apiary).values_list(
                "colonyID", flat=True
            )
        )
        self.assertEqual(ids, ["Alpha", "Bravo", "Charlie"])

    # ----- field defaults ----------------------------------------------

    def test_status_defaults_to_C(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        c.refresh_from_db()
        self.assertEqual(c.status, "C")

    def test_queenRight_defaults_to_true(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        c.refresh_from_db()
        self.assertIs(c.queenRight, True)

    def test_size_defaults_to_3(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        c.refresh_from_db()
        self.assertEqual(c.size, 3)

    def test_descr_and_notes_default_to_none(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        c.refresh_from_db()
        self.assertIsNone(c.descr)
        self.assertIsNone(c.notes)

    def test_status_dt_and_lastAction_default_to_now(self):
        before = timezone.now()
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        after = timezone.now()
        c.refresh_from_db()
        self.assertTrue(before <= c.status_dt <= after)  # type: ignore
        self.assertTrue(before <= c.lastAction <= after)  # type: ignore

    # ----- cascade behaviour -------------------------------------------

    def test_deleting_apiary_cascades_to_colony(self):
        ap = models.Apiary.objects.create(apiaryID="DoomedAp", beek=self.user)
        c = models.Colony.objects.create(apiary=ap, colonyID="ColInDoom")
        self.assertTrue(models.Colony.objects.filter(id=c.id).exists())  # type: ignore
        ap.delete()
        self.assertFalse(models.Colony.objects.filter(id=c.id).exists())  # type: ignore

    # ----- statusDisplay() ---------------------------------------------

    def test_statusDisplay_maps_each_known_code(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        for code, label in (
            ("C", "Current"),
            ("D", "Dead"),
            ("A", "Absconded"),
            ("S", "Sold/given"),
            ("M", "Combined"),
        ):
            c.status = code
            self.assertEqual(c.statusDisplay(), label)

    def test_statusDisplay_returns_question_mark_for_unknown_code(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        c.status = "X"  # not in STATUS_CHOICES
        self.assertEqual(c.statusDisplay(), "?")

    # ----- lastInspection() --------------------------------------------

    def test_lastInspection_returns_none_when_no_inspections(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        self.assertIsNone(c.lastInspection())

    def test_lastInspection_returns_most_recent_inspection(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        models.Inspection.objects.create(
            colony=c, dt=timezone.now() - datetime.timedelta(days=10)
        )
        newest = models.Inspection.objects.create(colony=c, dt=timezone.now())
        models.Inspection.objects.create(
            colony=c, dt=timezone.now() - datetime.timedelta(days=3)
        )
        self.assertEqual(c.lastInspection().id, newest.id)  # type: ignore

    # ----- diaryDueNew() (overdue, uncompleted, not yet notified) ------

    def test_diaryDueNew_includes_overdue_uncompleted_un_notified(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        target = self._make_diary(c, due_offset_days=-1)
        self._make_diary(c, due_offset_days=-1, notified=True)
        self._make_diary(c, due_offset_days=-1, completed=True)
        self._make_diary(c, due_offset_days=+5)
        ids = set(c.diaryDueNew().values_list("id", flat=True))
        self.assertEqual(ids, {target.id})  # type: ignore

    def test_diaryDueNew_orders_by_dueDt_ascending(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        d2 = self._make_diary(c, due_offset_days=-2)
        d5 = self._make_diary(c, due_offset_days=-5)
        d10 = self._make_diary(c, due_offset_days=-10)
        ids = list(c.diaryDueNew().values_list("id", flat=True))
        self.assertEqual(ids, [d10.id, d5.id, d2.id])  # type: ignore

    # ----- diaryDue() (overdue, uncompleted, already notified) ---------

    def test_diaryDue_includes_overdue_uncompleted_already_notified(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        target = self._make_diary(c, due_offset_days=-1, notified=True)
        self._make_diary(c, due_offset_days=-1)  # not notified -> excluded
        self._make_diary(c, due_offset_days=-1, notified=True, completed=True)
        self._make_diary(c, due_offset_days=+5, notified=True)
        ids = set(c.diaryDue().values_list("id", flat=True))
        self.assertEqual(ids, {target.id})  # type: ignore

    def test_diaryDue_orders_by_dueDt_ascending(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="A")
        d2 = self._make_diary(c, due_offset_days=-2, notified=True)
        d5 = self._make_diary(c, due_offset_days=-5, notified=True)
        d10 = self._make_diary(c, due_offset_days=-10, notified=True)
        ids = list(c.diaryDue().values_list("id", flat=True))
        self.assertEqual(ids, [d10.id, d5.id, d2.id])  # type: ignore

    # ----- field metadata ----------------------------------------------

    def test_colonyID_max_length(self):
        self.assertEqual(models.Colony._meta.get_field("colonyID").max_length, 50)

    def test_status_max_length(self):
        self.assertEqual(models.Colony._meta.get_field("status").max_length, 1)

    def test_apiary_on_delete_is_cascade(self):
        f = models.Colony._meta.get_field("apiary")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_status_choices_match(self):
        f = models.Colony._meta.get_field("status")
        self.assertEqual(
            list(f.choices),  # type: ignore
            [
                ("C", "Current"),
                ("D", "Dead"),
                ("A", "Absconded"),
                ("S", "Sold/given"),
                ("M", "Combined"),
            ],
        )

    def test_size_choices_match(self):
        f = models.Colony._meta.get_field("size")
        self.assertEqual(
            list(f.choices),  # type: ignore
            [
                (1, "Micro - 3 - mini frames"),
                (2, "Little - queen castle or nuc"),
                (3, "Small - single storey brood chamber, 9-10 frames"),
                (4, "Large - double storey brood chamber, 18 - 20 frames"),
                (5, "Huge - 3 or more storey brood chamber"),
            ],
        )

    # ----- reverse accessors -------------------------------------------

    def test_apiary_has_colony_set_reverse_manager(self):
        c = models.Colony.objects.create(apiary=self.apiary, colonyID="Rev")
        self.assertIn(c, list(self.apiary.colony_set.all()))  # type: ignore
