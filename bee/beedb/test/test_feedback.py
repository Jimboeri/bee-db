"""
Characterisation (pin-down) tests for beedb.models.Feedback.

Locks in current behaviour of Feedback's fields, defaults, choices, and
cascade rules. Read-only on intent -- the tests do not assert what the
behaviour *should* be, only what it is.
"""

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class FeedbackCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("feedback_char_user")

    # ----- __str__ ---------------------------------------------------------

    def test_str_returns_subject_and_username(self):
        f = models.Feedback.objects.create(beek=self.user, subject="Great app")
        self.assertEqual(str(f), f"Great app (from {self.user.username})")

    # ----- field defaults --------------------------------------------------

    def test_feedbackType_defaults_to_F(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertEqual(f.feedbackType, "F")

    def test_status_defaults_to_N(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertEqual(f.status, "N")

    def test_createdDt_defaults_to_now(self):
        before = timezone.now()
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        after = timezone.now()
        f.refresh_from_db()
        self.assertTrue(before <= f.createdDt <= after)

    def test_detail_defaults_to_none(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertIsNone(f.detail)

    def test_devComment_defaults_to_none(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertIsNone(f.devComment)

    def test_lstStatusDt_defaults_to_none(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertIsNone(f.lstStatusDt)

    def test_lstCommentDt_defaults_to_none(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        f.refresh_from_db()
        self.assertIsNone(f.lstCommentDt)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_beek_cascades_to_feedback(self):
        user = User.objects.create_user("feedback_cascade_user")
        f = models.Feedback.objects.create(beek=user, subject="s")
        self.assertTrue(models.Feedback.objects.filter(id=f.id).exists())  # type: ignore
        user.delete()
        self.assertFalse(models.Feedback.objects.filter(id=f.id).exists())  # type: ignore

    # ----- field metadata --------------------------------------------------

    def test_beek_on_delete_is_cascade(self):
        f = models.Feedback._meta.get_field("beek")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_subject_max_length(self):
        self.assertEqual(models.Feedback._meta.get_field("subject").max_length, 100)

    def test_feedbackType_max_length(self):
        self.assertEqual(
            models.Feedback._meta.get_field("feedbackType").max_length, 1
        )

    def test_status_max_length(self):
        self.assertEqual(models.Feedback._meta.get_field("status").max_length, 1)

    def test_feedbackType_choices(self):
        f = models.Feedback._meta.get_field("feedbackType")
        self.assertEqual(
            list(f.choices),  # type: ignore
            [
                ("F", "General feedback"),
                ("B", "Bug report (error)"),
                ("R", "Request a feature"),
                ("S", "Suggestion"),
            ],
        )

    def test_status_choices(self):
        f = models.Feedback._meta.get_field("status")
        self.assertEqual(
            list(f.choices),  # type: ignore
            [
                ("N", "New feedback"),
                ("I", "Issue raised"),
                ("A", "Archived"),
            ],
        )

    # ----- reverse accessor ------------------------------------------------

    def test_user_has_feedback_set_reverse_manager(self):
        f = models.Feedback.objects.create(beek=self.user, subject="s")
        self.assertIn(f, list(self.user.feedback_set.all()))  # type: ignore
