"""
Characterisation (pin-down) tests for beedb.models.Diary.

Locks in current behaviour of Diary's fields, defaults, cascade rules,
ordering, and its two methods: __str__ and isDue. Read-only on intent --
the tests do not assert what the behaviour *should* be, only what it is.
"""

import datetime

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class DiaryCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("diary_char_user")
        cls.apiary = models.Apiary.objects.create(apiaryID="DiaryCharAp", beek=cls.user)
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="DiaryCharCol"
        )

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_beek_username_and_subject(self):
        d = models.Diary.objects.create(
            beek=self.user,
            subject="Test subject",
        )
        self.assertEqual(str(d), f"Beek: {self.user.username}, Subject: Test subject")

    def test_str_with_none_subject(self):
        d = models.Diary.objects.create(beek=self.user, subject=None)
        self.assertEqual(str(d), f"Beek: {self.user.username}, Subject: None")

    # ----- ordering --------------------------------------------------------

    def test_default_ordering_is_dueDt_descending(self):
        now = timezone.now()
        d_near = models.Diary.objects.create(
            beek=self.user, dueDt=now + datetime.timedelta(days=1)
        )
        d_far = models.Diary.objects.create(
            beek=self.user, dueDt=now + datetime.timedelta(days=10)
        )
        d_past = models.Diary.objects.create(
            beek=self.user, dueDt=now - datetime.timedelta(days=1)
        )
        ids = list(
            models.Diary.objects.filter(beek=self.user).values_list("id", flat=True)
        )
        self.assertEqual(ids, [d_far.id, d_near.id, d_past.id])

    # ----- field defaults --------------------------------------------------

    def test_completed_defaults_to_false(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIs(d.completed, False)

    def test_createdDt_defaults_to_now(self):
        before = timezone.now()
        d = models.Diary.objects.create(beek=self.user)
        after = timezone.now()
        d.refresh_from_db()
        self.assertTrue(before <= d.createdDt <= after)  # type: ignore

    def test_dueDt_defaults_to_one_week_from_now(self):
        before = timezone.now() + datetime.timedelta(weeks=1)
        d = models.Diary.objects.create(beek=self.user)
        after = timezone.now() + datetime.timedelta(weeks=1)
        d.refresh_from_db()
        self.assertTrue(before <= d.dueDt <= after)

    def test_startDt_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.startDt)

    def test_notifyDt_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.notifyDt)

    def test_subject_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.subject)

    def test_details_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.details)

    def test_apiary_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.apiary)

    def test_colony_defaults_to_none(self):
        d = models.Diary.objects.create(beek=self.user)
        d.refresh_from_db()
        self.assertIsNone(d.colony)

    # ----- isDue() ---------------------------------------------------------

    def test_isDue_returns_false_when_dueDt_is_in_future(self):
        d = models.Diary.objects.create(
            beek=self.user,
            dueDt=timezone.now() + datetime.timedelta(days=1),
        )
        self.assertFalse(d.isDue())

    def test_isDue_returns_true_when_dueDt_is_in_past_and_not_completed(self):
        d = models.Diary.objects.create(
            beek=self.user,
            dueDt=timezone.now() - datetime.timedelta(days=1),
        )
        self.assertTrue(d.isDue())

    def test_isDue_returns_false_when_overdue_but_completed(self):
        d = models.Diary.objects.create(
            beek=self.user,
            dueDt=timezone.now() - datetime.timedelta(days=1),
            completed=True,
        )
        self.assertFalse(d.isDue())

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_beek_cascades_to_diary(self):
        user = User.objects.create_user("diary_cascade_user")
        d = models.Diary.objects.create(beek=user)
        self.assertTrue(models.Diary.objects.filter(id=d.id).exists())  # type: ignore
        user.delete()
        self.assertFalse(models.Diary.objects.filter(id=d.id).exists())  # type: ignore

    def test_deleting_apiary_sets_diary_apiary_to_null(self):
        ap = models.Apiary.objects.create(apiaryID="DoomedDiaryAp", beek=self.user)
        d = models.Diary.objects.create(beek=self.user, apiary=ap)
        ap.delete()
        d.refresh_from_db()
        self.assertIsNone(d.apiary)

    def test_deleting_colony_sets_diary_colony_to_null(self):
        ap = models.Apiary.objects.create(apiaryID="DoomedDiaryAp2", beek=self.user)
        col = models.Colony.objects.create(apiary=ap, colonyID="DoomedDiaryCol")
        d = models.Diary.objects.create(beek=self.user, colony=col)
        col.delete()
        d.refresh_from_db()
        self.assertIsNone(d.colony)

    # ----- field metadata --------------------------------------------------

    def test_beek_on_delete_is_cascade(self):
        f = models.Diary._meta.get_field("beek")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_apiary_on_delete_is_set_null(self):
        f = models.Diary._meta.get_field("apiary")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_colony_on_delete_is_set_null(self):
        f = models.Diary._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_subject_max_length(self):
        self.assertEqual(models.Diary._meta.get_field("subject").max_length, 100)

    def test_dueDt_verbose_name(self):
        self.assertEqual(
            models.Diary._meta.get_field("dueDt").verbose_name, "Date to complete by"
        )

    # ----- reverse accessors -----------------------------------------------

    def test_user_has_diary_set_reverse_manager(self):
        d = models.Diary.objects.create(beek=self.user, subject="ReverseTest")
        self.assertIn(d, list(self.user.diary_set.all()))  # type: ignore
