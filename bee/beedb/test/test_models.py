import datetime

from django.test import TestCase
from django.contrib.auth.models import User
from django.utils import timezone
from beedb import models

# Create your tests here.

class ModelTests(TestCase):
    fixtures = ['fixture3', 'SizeChoice']
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
        #insp1 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now()-datetime.timedelta(days=7), notes='Old Inspection')
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

    def getSizeChoice(self, size, type, value):
        cSize = models.SizeChoice.objects.filter(size=size).filter(type__iexact=type).filter(value=value)
        if cSize:
            return cSize[0].text
        else:
            return " "

    def test_Model_Inspection(self):
        #insp1 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now()-datetime.timedelta(days=7), notes='Old Inspection')
        insp2 = models.Inspection.objects.create(colony=self.col1, dt=timezone.now(), notes='Latest Inspection')
        self.assertEqual(insp2.__str__(), f"Date: {insp2.dt}, Colony: {insp2.colony.colonyID}, health: {insp2.healthScore():.1f}")
        # check valid data
        insp2.numbers = 2
        insp2.size = 3
        Choices = self.getSizeChoice(insp2.size, 'Number', insp2.numbers)
        self.assertEqual(Choices, insp2.numChoiceDisplay())

        #check bad size
        insp2.size = 8
        Choices = self.getSizeChoice(insp2.size, 'Number', insp2.numbers)
        self.assertEqual(Choices, insp2.numChoiceDisplay())

        #check bad numbers
        insp2.size = 2
        insp2.numbers = 20
        Choices = self.getSizeChoice(insp2.size, 'Number', insp2.numbers)
        self.assertEqual(Choices, insp2.numChoiceDisplay())

        #weight checks
        #check def weight
        insp2.size = 2
        insp2.weight = 0
        Choices = self.getSizeChoice(insp2.size, 'Weight', insp2.weight)
        #print(f"Size = {insp2.size}, weight = {insp2.weight}, Choice text = {Choices}")
        self.assertEqual(Choices, insp2.weightChoiceDisplay())

        #check good weight
        insp2.size = 2
        insp2.weight = 2
        Choices = self.getSizeChoice(insp2.size, 'Weight', insp2.weight)
        #print(f"Size = {insp2.size}, weight = {insp2.weight}, Choice text = {Choices}")
        self.assertEqual(Choices, insp2.weightChoiceDisplay())

        #check bad weight
        insp2.size = 2
        insp2.weight = 24
        Choices = self.getSizeChoice(insp2.size, 'Weight', insp2.weight)
        #print(f"Size = {insp2.size}, weight = {insp2.weight}, Choice text = {Choices}")
        self.assertEqual(Choices, insp2.weightChoiceDisplay())

        #check bad size
        insp2.size = 24
        insp2.weight = 3
        Choices = self.getSizeChoice(insp2.size, 'Weight', insp2.weight)
        #print(f"Size = {insp2.size}, weight = {insp2.weight}, Choice text = {Choices}")
        self.assertEqual(Choices, insp2.weightChoiceDisplay())

        # Check varroa
        print(f"Varoa number {insp2.varroa}, varroa text {insp2.varroaChoiceDisplay()}")
        self.assertEqual("Not recorded", insp2.varroaChoiceDisplay())
        insp2.varroa = 2
        self.assertEqual("1 - 2 varroa / 300 bees", insp2.varroaChoiceDisplay())
        insp2.varroa = 25
        self.assertEqual("?", insp2.varroaChoiceDisplay())

        # Check Eggs
        print(f"Egg number {insp2.eggs}, egg text {insp2.eggChoiceDisplay()}")
        self.assertEqual("Not recorded", insp2.eggChoiceDisplay())
        insp2.eggs = 2
        self.assertEqual("Lots of eggs & larvae, but spotty brood", insp2.eggChoiceDisplay())
        insp2.eggs = 25
        self.assertEqual("?", insp2.eggChoiceDisplay())

        # Check Desease
        print(f"Desease number {insp2.disease}, disease text {insp2.diseaseChoiceDisplay()}")
        self.assertEqual("Not recorded", insp2.diseaseChoiceDisplay())
        insp2.disease = 3
        self.assertEqual("Some disease", insp2.diseaseChoiceDisplay())
        insp2.disease = 25
        self.assertEqual("?", insp2.diseaseChoiceDisplay())

        # Check Desease
        print(f"Temper number {insp2.temper}, temper text {insp2.temperChoiceDisplay()}")
        self.assertEqual("Not recorded", insp2.temperChoiceDisplay())
        insp2.temper = 3
        self.assertEqual("Bees a bit defensive", insp2.temperChoiceDisplay())
        insp2.temper = 25
        self.assertEqual("?", insp2.temperChoiceDisplay())

        

        return
