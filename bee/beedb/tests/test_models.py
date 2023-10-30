import datetime

from django.test import TestCase
from django.contrib.auth.models import User
from django.utils import timezone
from beedb import models

# Create your tests here.

class ModelTests(TestCase):
    fixtures = ['fixture3']
    @classmethod

    def setUpTestData(cls):
        cls.etUser = User.objects.get(username='et@west.net.nz')   # defined in fixture3
        cls.user = User.objects.create_user('testuser',)
        cls.user.save()
        cls.ap = models.Apiary.objects.create(apiaryID='Test Apiary', beek=cls.user)
        cls.col1 = models.Colony.objects.create(colonyID='Test Colony 1', apiary=cls.ap)

    def setUp(self):
        #self.user = User.objects.create_user('testuser',)
        #self.etUser = User.objects.get(username='et@west.net.nz')
        #self.col1 = models.Colony.objects.get(colonyID='Test Colony 1')     
        #self.user.save()
        pass

    def test_Model_Profile(self):
        self.assertEqual(self.user.profile.__str__(), self.user.username)

    def test_Model_Apiary(self):
        ap = self.user.apiary_set.all().filter(apiaryID='Test Apiary')
        self.assertEqual(ap[0].__str__(), ap[0].apiaryID)
        return
    
    def test_Model_Colony(self):
        self.assertEqual(self.col1.__str__(), self.col1.colonyID)
        # check for no inspections
        self.assertEqual(self.col1.lastInspection(), None)
        insp1 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now()-datetime.timedelta(days=7), notes='Old Inspection')
        insp2 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now(), notes='Latest Inspection')
        self.assertEqual(self.col1.lastInspection(), insp2)
        # status checks
        self.assertEqual(self.col1.statusDisplay(), 'Current')
        self.col1.status = 'D'
        self.assertEqual(self.col1.statusDisplay(), 'Dead')
        self.col1.status = 'A'
        self.assertEqual(self.col1.statusDisplay(), 'Absconded')
        self.col1.status = 'S'
        self.assertEqual(self.col1.statusDisplay(), 'Sold/given')
        self.col1.status = 'M'
        self.assertEqual(self.col1.statusDisplay(), 'Combined')
        self.col1.status = 'X'
        self.assertEqual(self.col1.statusDisplay(), '?')

        # Size display checks
        self.assertTrue(1 <= self.col1.size <= 5)
        self.assertIn('Small - single storey brood chamber', self.col1.get_size_display())
        self.col1.size = 1
        self.assertEqual(self.col1.get_size_display(), "Micro - 3 - mini frames")
        self.col1.size = 2
        self.assertEqual(self.col1.get_size_display(), "Little - queen castle or nuc")
        self.col1.size = 4
        self.assertEqual(self.col1.get_size_display(), "Large - double storey brood chamber, 18 - 20 frames")
        self.col1.size = 5
        self.assertEqual(self.col1.get_size_display(), "Huge - 3 or more storey brood chamber")


        #print(f"col1.size: {self.col1.get_size_display()}")
        return

    def test_Model_Inspection(self):
        #insp1 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now()-datetime.timedelta(days=7), notes='Old Inspection')
        insp2 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now(), notes='Latest Inspection')
        #self.assertEqual(insp1.__str__(), insp1.notes)
        self.assertEqual(insp2.__str__(), f"Date: {insp2.dt}, Colony: {insp2.colony.colonyID}, health: {insp2.healthScore():.1f}")
        
        #print(f"insp2.numbers: {insp2.numbers} insp2.colony.size: {insp2.colony.size}")

        return