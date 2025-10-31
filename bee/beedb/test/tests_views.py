from django.test import TestCase, Client  # type: ignore
from django.contrib.auth.models import User  # type: ignore
from beedb import models
from django.urls import reverse  # type: ignore
import datetime


def printResp(response):
    print(f"Response code: {response.status_code}")
    # print("Response headers:")
    # for k, v in response.items():
    #    print(f"  {k}:{v}")
    # print("Response cookies:")
    # for k, v in response.cookies.items():
    #    print(f"  {k}:{v}")
    # print("Response content:")
    # print(response.content)
    print(f"Response templates: {response.templates}")

    print(f"Response context:{response.context}")
    # print(f"Response url:{response.url}")

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
    # fixtures = ["fixture3.json"]
    serialized_rollback = True

    @classmethod
    def setUpTestData(cls):
        cls.rodUser = User.objects.get(
            username="rod@west.net.nz"
        )  # defined in fixture3
        cls.user = User.objects.create_user(
            "testuser",
        )
        cls.user.save()
        cls.ap = models.Apiary.objects.create(apiaryID="Test Apiary", beek=cls.user)
        cls.col1 = models.Colony.objects.create(colonyID="Test Colony 1", apiary=cls.ap)

        try:
            cls.rodUser = User.objects.get(username="rod@west.net.nz")
            cls.jimUser = User.objects.get(username="jim")
        except User.DoesNotExist:
            cls.rodUser = User.objects.create_user(
                "rod@west.net.nz", password="password"
            )
            cls.rodUser.save()

    def setUp(self):
        self.client = Client()
        pass

    def test_InspectionAdd_view(self):
        """
        Tests for the addition of inspections

        Start with simple tests and then add more

        """
        # Login jim, but try for test user colony
        self.client.force_login(self.jimUser)
        response = self.client.get(reverse("beedb:inspectAdd", args=[self.col1.id]))  # type: ignore
        self.assertTemplateUsed("beedb/not_authorised.html")
        self.assertEqual(response.status_code, 200)

        # Login test user from the fixture load
        self.client.force_login(self.user)
        response = self.client.get(reverse("beedb:inspectAdd", args=[self.col1.id]))  # type: ignore
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed("beedb/inspectAdd.html")

    def test_Inspection_form(self):
        """
        Tests for the addition of inspections via form post

        Start with simple tests and then add more

        """
        inspDt = datetime.datetime.now().date()
        # Create form data
        form_data = {
            "dt": inspDt.strftime("%Y-%m-%d"),
            "notes": "Test inspection notes",
            "numbers": 0,
            "eggs": 0,
            "varroa": 0,
            "disease": 0,
            "weight": 4,
            "temper": 1,
            "broodFrames": 5,
        }
        # Login test user from the fixture load
        self.client.force_login(self.user)
        response = self.client.post(
            reverse("beedb:inspectAdd", args=[self.col1.id]),  # type: ignore
            form_data,
        )
        print(response.status_code)
        self.assertEqual(response.status_code, 302)
        # Should go to colony view
        self.assertTemplateUsed("beedb/colDetail.html")

        # Now check that the inspection was created
        inspections = models.Inspection.objects.filter(colony=self.col1)
        self.assertEqual(inspections.count(), 1)
        inspection = inspections.first()
        # self.assertEqual(str(inspection.dt.strftime("%Y-%m-%d")), inspDt.strftime("%Y-%m-%d"))
        self.assertEqual(inspection.notes, "Test inspection notes")

        # Now to test form error
        form_data["varroa"] = 7  # invalid data
        response = self.client.post(
            reverse("beedb:inspectAdd", args=[self.col1.id]),  # type: ignore
            form_data,
        )
        print(response.status_code)
        self.assertEqual(response.status_code, 200)

    def test_ApChooseReport(self):
        # Not logged in so expect a redirect to login
        response = self.client.get(reverse("beedb:apReportChoose"))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(response.url, "/beedb/login?next=/beedb/apReportChoose/")  # type: ignore

        # now login a user, should get code 200
        # self.client.force_login(self.jimUser)
        self.client.force_login(self.user)
        response = self.client.get(reverse("beedb:apReportChoose"))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "beedb/apReportChoose.html")
        self.assertQuerySetEqual(response.context["apList"], [self.ap])

        # now test the report view
        response = self.client.get(reverse("beedb:apReport", args=[self.ap.id, 4]))  # type: ignore
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "beedb/apReport.html")

    #    self.assertContains(response, "Test Apiary")
