from .models import SizeChoice
from django.contrib.auth.models import User

import logging

def sizeChoices(inSize, inType):
    """
    Function to return a tuple to a size choice field
    """
    choices = SizeChoice.objects.filter(size=inSize).filter(type__iexact=inType)
    lChoice = []
    for ch in choices:
        lChoice.append((ch.value, ch.text))
    logging.info(f"Choice is {lChoice}")
    return(lChoice) 

def usrCheck(request):
    """
    Function to assist with visitors/super users seeing other beeks info
    """
    usrInfo = {"procBeek": request.user, "getParams": "", "isOwner": True}
    procBeek = request.user
    if request.user.is_superuser:       # can do this only is a superuser
        if 'beek' in request.GET:       # if there ws a beek param in the url
            beekID = request.GET['beek']
            beeks = User.objects.filter(id=beekID)
            if beeks:               # Does the beek exist
                usrInfo["procBeek"] = beeks[0]
                usrInfo["getParams"] = f"?beek={usrInfo['procBeek'].id}"
                usrInfo["isOwner"] = False
                logging.debug(f"Beek {procBeek.username} selected")
    
    return(usrInfo)
