from django.test import TestCase, Client # type: ignore
from django.contrib.auth.models import User # type: ignore
from beedb import models
from django.urls import reverse

def printResp(response):
    print(f"Response code: {response.status_code}")
    print("Response headers:")
    for k, v in response.items():
        print(f"  {k}:{v}")
    print("Response cookies:")
    for k, v in response.cookies.items():
        print(f"  {k}:{v}")
    print("Response content:")
    print(response.content)
    print(f"Response templates: {response.templates}")

    print(f"Response context:{response.context}")
    print(f"Response url:{response.url}")

    print("End of response")
    return

def printClient(client):
    print("Client sessions:")
    for k, v in client.session.items():
        print(f"  {k}:{v}")
    print("Client cookies:")
    for k, v in client.cookies.items():
        print(f"  {k}:{v}")

    print("End of client")
    return

# Create your tests here.
class ViewTests(TestCase):
    #fixtures = ["fixture3.json"]
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):

        allUsr = User.objects.all()
        print("All users:")
        for u in allUsr:
            print(u)

        #cls.etUser = User.objects.get(username="rod@west.net.nz")  # defined in fixture3
        cls.user = User.objects.create_user(
            "testuser",
        )
        cls.user.save()
        cls.ap = models.Apiary.objects.create(apiaryID="Test Apiary", beek=cls.user)
        cls.col1 = models.Colony.objects.create(colonyID="Test Colony 1", apiary=cls.ap)

        try:
            cls.rodUser = User.objects.get(username="rod@west.net.nz")
        except User.DoesNotExist:
            cls.rodUser = User.objects.create_user("rod@west.net.nz", password="password")
            cls.rodUser.save()

    def setUp(self):
        self.client = Client()
        pass

    def  test_ApChooseReport(self):
        # Not logged in so expect a redirect to login
        response = self.client.get(reverse("beedb:colReportChoose"))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, "/beedb/login?next=/beedb/colReportChoose/")

        # now login a user, should get code 200                 
        #self.client.force_login(self.rodUser)
        self.client.login(username="jim", password="whuck1tt")
        printClient(self.client)
        response = self.client.get(reverse("beedb:colReportChoose"))
        #printResp(response)
        #self.assertEqual(response.status_code, 200)
        #response = self.client.get(f"/beedb/apchoose_report/{self.ap.id}/")
    #    self.assertEqual(response.status_code, 200)
    #    self.assertTemplateUsed(response, "beedb/apchoose_report.html")
    #    self.assertContains(response, "Test Apiary")

