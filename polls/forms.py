from django import forms
from .models import TravelTime, WaitTime

class TravelTimeModelForm(forms.ModelForm):
    location = forms.CharField(
        required=True,
        widget=forms.TextInput(
            attrs={"placeholder": "Start Location",}
        ),
    )
    destination = forms.CharField(
        required=True,
        widget=forms.TextInput(
            attrs={"placeholder": "Destination",}
        ),
    )
    # travel_mode = forms.CharField(
    #     required=True,
    #     widget=forms.Select(
    #         attrs={"placeholder": "Travel",}
    #     ),
    # )
    class Meta:
        model= TravelTime
        fields=['location','destination','travel_mode']

# class WaitTimeModelForm(forms.ModelForm):
#     class Meta:
#         model= WaitTime
#         fields=['destination']
        