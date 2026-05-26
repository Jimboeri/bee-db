"""
Characterisation (pin-down) tests for beedb.models.Picture and the
user_directory upload-path helper.

Locks in current behaviour of Picture's fields, defaults, ordering,
cascade rules, and the user_directory routing function. Read-only on
intent -- the tests do not assert what the behaviour *should* be, only
what it is.

A minimal fake image file is used via SimpleUploadedFile so the ImageField
can be satisfied without hitting the filesystem meaningfully. Tests run
under a temporary MEDIA_ROOT so uploaded stubs are cleaned up automatically.
"""

import datetime
import shutil
import tempfile

from django.contrib.auth.models import User  # type: ignore
from django.core.files.uploadedfile import SimpleUploadedFile  # type: ignore
from django.db import models as djmodels  # type: ignore
from django.test import TestCase, override_settings  # type: ignore
from django.utils import timezone  # type: ignore

from beedb import models
from beedb.models import user_directory

TEMP_MEDIA = tempfile.mkdtemp()


def _fake_image(name="test.jpg"):
    """Return a minimal SimpleUploadedFile that satisfies ImageField."""
    return SimpleUploadedFile(name, b"fake-image-content", content_type="image/jpeg")


@override_settings(MEDIA_ROOT=TEMP_MEDIA)
class PictureCharacterisationTests(TestCase):
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("picture_char_user")
        cls.apiary = models.Apiary.objects.create(
            apiaryID="PictureCharAp", beek=cls.user
        )
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="PictureCharCol"
        )
        cls.inspection = models.Inspection.objects.create(colony=cls.colony)

    @classmethod
    def tearDownClass(cls):
        super().tearDownClass()
        shutil.rmtree(TEMP_MEDIA, ignore_errors=True)

    def _make_picture(self, **kwargs):
        defaults = {"title": "Test pic", "img": _fake_image()}
        defaults.update(kwargs)
        return models.Picture.objects.create(**defaults)

    # ----- __str__ ---------------------------------------------------------

    def test_str_format(self):
        p = self._make_picture()
        self.assertEqual(str(p), f"Title: {p.title}, uploaded {p.uploadDt}")

    # ----- ordering --------------------------------------------------------

    def test_default_ordering_is_uploadDt_descending(self):
        now = timezone.now()
        old = self._make_picture(
            title="old",
            img=_fake_image(),
            uploadDt=now - datetime.timedelta(days=10),
        )
        mid = self._make_picture(
            title="mid",
            img=_fake_image(),
            uploadDt=now - datetime.timedelta(days=5),
        )
        new = self._make_picture(
            title="new",
            img=_fake_image(),
            uploadDt=now,
        )
        ids = list(
            models.Picture.objects.filter(title__in=["old", "mid", "new"]).values_list(
                "id", flat=True
            )
        )
        self.assertEqual(ids, [new.id, mid.id, old.id])

    # ----- field defaults --------------------------------------------------

    def test_uploadDt_defaults_to_now(self):
        before = timezone.now()
        p = self._make_picture()
        after = timezone.now()
        p.refresh_from_db()
        self.assertTrue(before <= p.uploadDt <= after)

    def test_beek_defaults_to_none(self):
        p = self._make_picture()
        p.refresh_from_db()
        self.assertIsNone(p.beek)

    def test_apiary_defaults_to_none(self):
        p = self._make_picture()
        p.refresh_from_db()
        self.assertIsNone(p.apiary)

    def test_colony_defaults_to_none(self):
        p = self._make_picture()
        p.refresh_from_db()
        self.assertIsNone(p.colony)

    def test_inspection_defaults_to_none(self):
        p = self._make_picture()
        p.refresh_from_db()
        self.assertIsNone(p.inspection)

    # ----- cascade behaviour -----------------------------------------------

    def test_deleting_beek_sets_picture_beek_to_null(self):
        user = User.objects.create_user("picture_cascade_user")
        p = self._make_picture(beek=user)
        user.delete()
        p.refresh_from_db()
        self.assertIsNone(p.beek)

    def test_deleting_apiary_sets_picture_apiary_to_null(self):
        ap = models.Apiary.objects.create(apiaryID="DoomedPicAp", beek=self.user)
        p = self._make_picture(apiary=ap)
        ap.delete()
        p.refresh_from_db()
        self.assertIsNone(p.apiary)

    def test_deleting_colony_sets_picture_colony_to_null(self):
        col = models.Colony.objects.create(apiary=self.apiary, colonyID="DoomedPicCol")
        p = self._make_picture(colony=col)
        col.delete()
        p.refresh_from_db()
        self.assertIsNone(p.colony)

    def test_deleting_inspection_sets_picture_inspection_to_null(self):
        col = models.Colony.objects.create(
            apiary=self.apiary, colonyID="DoomedPicInspCol"
        )
        insp = models.Inspection.objects.create(colony=col)
        p = self._make_picture(inspection=insp)
        insp.delete()
        p.refresh_from_db()
        self.assertIsNone(p.inspection)

    # ----- field metadata --------------------------------------------------

    def test_beek_on_delete_is_set_null(self):
        f = models.Picture._meta.get_field("beek")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_apiary_on_delete_is_set_null(self):
        f = models.Picture._meta.get_field("apiary")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_colony_on_delete_is_set_null(self):
        f = models.Picture._meta.get_field("colony")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_inspection_on_delete_is_set_null(self):
        f = models.Picture._meta.get_field("inspection")
        self.assertIs(f.remote_field.on_delete, djmodels.SET_NULL)  # type: ignore

    def test_title_max_length(self):
        self.assertEqual(models.Picture._meta.get_field("title").max_length, 100)

    # ----- reverse accessors -----------------------------------------------

    def test_colony_has_picture_set_reverse_manager(self):
        p = self._make_picture(colony=self.colony)
        self.assertIn(p, list(self.colony.picture_set.all()))  # type: ignore

    def test_inspection_has_picture_set_reverse_manager(self):
        p = self._make_picture(inspection=self.inspection)
        self.assertIn(p, list(self.inspection.picture_set.all()))  # type: ignore


@override_settings(MEDIA_ROOT=TEMP_MEDIA)
class UserDirectoryCharacterisationTests(TestCase):
    """Pins down the upload-path routing in user_directory()."""

    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.user = User.objects.create_user("ud_char_user")
        cls.apiary = models.Apiary.objects.create(apiaryID="UDCharAp", beek=cls.user)
        cls.colony = models.Colony.objects.create(
            apiary=cls.apiary, colonyID="UDCharCol"
        )
        cls.inspection = models.Inspection.objects.create(colony=cls.colony)

    def _stub(self, **kwargs):
        """Create a minimal Picture-like object with only the given FK attrs."""

        class Stub:
            inspection = None
            colony = None
            apiary = None
            beek = None

        s = Stub()
        for k, v in kwargs.items():
            setattr(s, k, v)
        return s

    def test_inspection_path_takes_priority(self):
        stub = self._stub(inspection=self.inspection)
        insp = self.inspection
        expected = (
            f"images/{insp.colony.apiary.beek.id}"
            f"/{insp.colony.apiary.id}"
            f"/{insp.colony.id}"
            f"/{insp.id}/photo.jpg"
        )
        self.assertEqual(user_directory(stub, "photo.jpg"), expected)

    def test_colony_path_when_no_inspection(self):
        stub = self._stub(colony=self.colony)
        expected = (
            f"images/{self.colony.apiary.beek.id}"
            f"/{self.colony.apiary.id}"
            f"/{self.colony.id}/photo.jpg"
        )
        self.assertEqual(user_directory(stub, "photo.jpg"), expected)

    def test_apiary_path_when_no_inspection_or_colony(self):
        stub = self._stub(apiary=self.apiary)
        expected = f"images/{self.apiary.beek.id}/{self.apiary.id}/photo.jpg"
        self.assertEqual(user_directory(stub, "photo.jpg"), expected)

    def test_beek_path_when_only_beek(self):
        stub = self._stub(beek=self.user)
        expected = f"images/{self.user.id}/photo.jpg"
        self.assertEqual(user_directory(stub, "photo.jpg"), expected)

    def test_fallback_path_when_all_none(self):
        stub = self._stub()
        self.assertEqual(user_directory(stub, "photo.jpg"), "images/photo.jpg")
