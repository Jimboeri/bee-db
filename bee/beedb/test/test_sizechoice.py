"""
Characterisation (pin-down) tests for beedb.models.SizeChoice.

Locks in current behaviour of SizeChoice's fields, ordering, and __str__.
Read-only on intent -- the tests do not assert what the behaviour *should*
be, only what it is.

The 60 SizeChoice rows from fixture3.json are available because
FixtureOnceRunner pre-loads it into the test database.
"""

from django.test import TestCase  # type: ignore

from beedb import models


class SizeChoiceCharacterisationTests(TestCase):
    serialized_rollback = True

    # ----- __str__ ---------------------------------------------------------

    def test_str_format(self):
        sc = models.SizeChoice.objects.create(
            size=9, type="TestType", value=7, text="Some text"
        )
        self.assertEqual(
            str(sc),
            "Size: 9, type: TestType, value: 7, text: Some text",
        )

    # ----- ordering --------------------------------------------------------

    def test_default_ordering_is_type_then_size_then_value(self):
        # Create three rows that should sort predictably on all three keys
        models.SizeChoice.objects.create(size=2, type="Z", value=2, text="z2")
        models.SizeChoice.objects.create(size=1, type="Z", value=1, text="z1")
        models.SizeChoice.objects.create(size=1, type="A", value=1, text="a1")
        rows = list(
            models.SizeChoice.objects.filter(type__in=["A", "Z"]).values_list(
                "type", "size", "value"
            )
        )
        self.assertEqual(
            rows,
            [("A", 1, 1), ("Z", 1, 1), ("Z", 2, 2)],
        )

    # ----- fixture data ----------------------------------------------------

    def test_fixture_loads_60_sizechoice_rows(self):
        # Sanity-check that the fixture pre-load is working
        self.assertEqual(models.SizeChoice.objects.count(), 60)

    def test_fixture_contains_expected_number_entry(self):
        sc = models.SizeChoice.objects.get(size=1, type="Number", value=2)
        self.assertEqual(sc.text, "Good bee numbers")

    def test_fixture_contains_expected_weight_entry(self):
        sc = models.SizeChoice.objects.get(size=1, type="Weight", value=1)
        self.assertIsInstance(sc.text, str)
        self.assertTrue(len(sc.text) > 0)

    # ----- field metadata --------------------------------------------------

    def test_type_max_length(self):
        self.assertEqual(models.SizeChoice._meta.get_field("type").max_length, 10)

    def test_text_max_length(self):
        self.assertEqual(models.SizeChoice._meta.get_field("text").max_length, 40)
