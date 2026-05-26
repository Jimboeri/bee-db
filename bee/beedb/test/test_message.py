"""
Characterisation (pin-down) tests for beedb.models.Message.

Locks in current behaviour of Message's fields and defaults. Read-only on
intent -- the tests do not assert what the behaviour *should* be, only
what it is.

Note: Message has no __str__ defined, so str() returns Django's default
"Message object (<pk>)".
"""

from django.contrib.auth.models import User  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models


class MessageCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("message_char_user")

    # ----- __str__ ---------------------------------------------------------

    def test_str_is_django_default(self):
        m = models.Message.objects.create(beek=self.user, subject="Hello")
        self.assertEqual(str(m), f"Message object ({m.pk})")

    # ----- field defaults --------------------------------------------------

    def test_processed_defaults_to_false(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertIs(m.processed, False)

    def test_createdDt_defaults_to_now(self):
        before = timezone.now()
        m = models.Message.objects.create(beek=self.user, subject="s")
        after = timezone.now()
        m.refresh_from_db()
        self.assertTrue(before <= m.createdDt <= after)

    def test_attempts_defaults_to_zero(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertEqual(m.attempts, 0)

    def test_body_defaults_to_none(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertIsNone(m.body)

    def test_html_defaults_to_none(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertIsNone(m.html)

    def test_processedDt_defaults_to_none(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertIsNone(m.processedDt)

    def test_lastTryDt_defaults_to_none(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        m.refresh_from_db()
        self.assertIsNone(m.lastTryDt)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_beek_cascades_to_message(self):
        user = User.objects.create_user("message_cascade_user")
        m = models.Message.objects.create(beek=user, subject="s")
        self.assertTrue(models.Message.objects.filter(id=m.id).exists())  # type: ignore
        user.delete()
        self.assertFalse(models.Message.objects.filter(id=m.id).exists())  # type: ignore

    # ----- field metadata --------------------------------------------------

    def test_beek_on_delete_is_cascade(self):
        f = models.Message._meta.get_field("beek")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)  # type: ignore

    def test_subject_max_length(self):
        self.assertEqual(models.Message._meta.get_field("subject").max_length, 100)

    # ----- reverse accessor ------------------------------------------------

    def test_user_has_message_set_reverse_manager(self):
        m = models.Message.objects.create(beek=self.user, subject="s")
        self.assertIn(m, list(self.user.message_set.all()))  # type: ignore
