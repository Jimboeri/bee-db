from .models import SizeChoice

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
    