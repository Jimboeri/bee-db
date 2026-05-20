"""
Characterisation (pin-down) tests for beedb.models.Profile.

Profile is auto-created by a post_save receiver on User, so every test
that needs a Profile just creates a User and reads .profile back.
"""

from django.contrib.auth.models import User  # type: ignore
from django.db import IntegrityError, models as djmodels, transaction  # type: ignore
from django.test import TestCase  # type: ignore

from beedb import models


class ProfileCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        # Read-only baseline user. Tests that mutate the profile create
        # their own user to avoid Django's per-instance related-object
        # cache leaking across tests.
        cls.user = User.objects.create_user("prof_char_user")

    # ----- auto-creation via post_save signal --------------------------

    def test_profile_auto_created_when_user_created(self):
        u = User.objects.create_user("prof_char_fresh")
        self.assertTrue(models.Profile.objects.filter(user=u).exists())

    def test_saving_existing_user_does_not_recreate_profile(self):
        # Receiver guards on kwargs["created"] -- update is a no-op.
        u = User.objects.create_user("prof_char_update")
        models.Profile.objects.filter(user=u).delete()
        u.last_name = "Changed"
        u.save()
        self.assertFalse(models.Profile.objects.filter(user=u).exists())

    # ----- __str__ ------------------------------------------------------

    def test_str_returns_username(self):
        self.assertEqual(str(self.user.profile), self.user.username)

    # ----- field defaults ----------------------------------------------

    def test_optional_text_fields_default_to_none(self):
        p = self.user.profile
        self.assertIsNone(p.phoneNumber)
        self.assertIsNone(p.bkRegistration)
        self.assertIsNone(p.address)
        self.assertIsNone(p.commsLstWeeklyEmail)

    def test_lastApiary_defaults_to_none(self):
        self.assertIsNone(self.user.profile.lastApiary)

    def test_inspect_period_defaults(self):
        p = self.user.profile
        self.assertEqual(p.inspectPeriodSummer, 14)
        self.assertEqual(p.inspectPeriodAutumn, 14)
        self.assertEqual(p.inspectPeriodWinter, 60)
        self.assertEqual(p.inspectPeriodSpring, 7)

    def test_inspect_boolean_defaults(self):
        p = self.user.profile
        self.assertIs(p.inspectHealthIndex, True)
        self.assertIs(p.inspectManualIndex, False)
        self.assertIs(p.inspectDiaryAdd, True)

    def test_comms_boolean_defaults(self):
        p = self.user.profile
        self.assertIs(p.commsWeeklySummary, False)
        self.assertIs(p.commsInspectionReminder, False)

    # ----- cascade behaviour -------------------------------------------

    def test_deleting_user_cascades_to_profile(self):
        u = User.objects.create_user("prof_char_doomed")
        self.assertTrue(models.Profile.objects.filter(user=u).exists())
        u.delete()
        self.assertFalse(
            models.Profile.objects.filter(
                user__username="prof_char_doomed"
            ).exists()
        )

    def test_deleting_lastApiary_sets_profile_lastApiary_to_null(self):
        u = User.objects.create_user("prof_char_lastap")
        ap = models.Apiary.objects.create(apiaryID="LastAp", beek=u)
        p = u.profile
        p.lastApiary = ap
        p.save()
        ap.delete()
        p.refresh_from_db()
        self.assertIsNone(p.lastApiary)

    # ----- uniqueness --------------------------------------------------

    def test_one_profile_per_user_enforced(self):
        u = User.objects.create_user("prof_char_unique")
        # Signal already created one; a second insert should violate the
        # OneToOneField uniqueness constraint.
        with self.assertRaises(IntegrityError):
            with transaction.atomic():
                models.Profile.objects.create(user=u)

    # ----- field metadata ----------------------------------------------

    def test_user_field_is_one_to_one(self):
        self.assertTrue(models.Profile._meta.get_field("user").one_to_one)

    def test_user_on_delete_is_cascade(self):
        f = models.Profile._meta.get_field("user")
        self.assertIs(f.remote_field.on_delete, djmodels.CASCADE)

    def test_lastApiary_on_delete_is_set_null(self):
        f = models.Profile._meta.get_field("lastApiary")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)

    def test_phoneNumber_max_length(self):
        self.assertEqual(
            models.Profile._meta.get_field("phoneNumber").max_length, 50
        )

    def test_bkRegistration_max_length(self):
        self.assertEqual(
            models.Profile._meta.get_field("bkRegistration").max_length, 10
        )

    def test_inspect_period_verbose_names(self):
        expected = {
            "inspectPeriodSummer": "Days between inspections in summer",
            "inspectPeriodAutumn": "Days between inspections in autumn/fall",
            "inspectPeriodWinter": "Days between inspections in winter",
            "inspectPeriodSpring": "Days between inspections in spring",
        }
        for name, label in expected.items():
            self.assertEqual(
                models.Profile._meta.get_field(name).verbose_name,
                label,
                f"verbose_name mismatch for {name}",
            )

    def test_commsWeeklySummary_verbose_name(self):
        self.assertEqual(
            models.Profile._meta.get_field("commsWeeklySummary").verbose_name,
            "Do you want weekly summary emails?",
        )

    # ----- reverse accessor --------------------------------------------

    def test_user_profile_reverse_accessor(self):
        # OneToOneField without related_name => user.profile (not profile_set).
        u = User.objects.create_user("prof_char_rev")
        self.assertIsInstance(u.profile, models.Profile)
