from django.test import TestCase # type: ignore
from django.contrib.auth.models import User # type: ignore


# Create your tests here.
class ViewTests(TestCase):
    fixtures = ["fixture3.json"]

    @classmethod
    def setUpTestData(cls):
        cls.etUser = User.objects.get(username="rod@west.net.nz")  # defined in fixture3
        cls.user = User.objects.create_user(
            "testuser",
        )
        cls.user.save()
        cls.ap = models.Apiary.objects.create(apiaryID="Test Apiary", beek=cls.user)
        cls.col1 = models.Colony.objects.create(colonyID="Test Colony 1", apiary=cls.ap)

    def setUp(self):
        # self.user = User.objects.create_user('testuser',)
        # self.etUser = User.objects.get(username='et@west.net.nz')
        # self.col1 = models.Colony.objects.get(colonyID='Test Colony 1')
        # self.user.save()
        pass

    def  test_ApChooseReport(self):
        self.client.login(username="testuser", password="")
        response = self.client.get(f"/beedb/apchoose_report/{self.ap.id}/")
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "beedb/apchoose_report.html")
        self.assertContains(response, "Test Apiary")

