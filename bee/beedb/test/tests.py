from django.test import TestCase
from django.contrib.auth.models import User


# Create your tests here.
class TestModels(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            "testuser",
        )

    def test_Model_Usr(self):
        self.assertTrue(True)
