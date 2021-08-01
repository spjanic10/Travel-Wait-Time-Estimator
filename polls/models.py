# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from django.db import models




# Create your models here.
from django.core.exceptions import ValidationError 

# Create your models here.
class TravelTime(models.Model):
    CHOICES=(
        ('driving','Driving'),
        ('transit', 'Public Transit'),
        ('walking','Walking'),
    )
    location=models.CharField(max_length=200)
    destination=models.CharField(max_length=200)
    travelling_time=models.IntegerField()
    travel_mode=models.CharField(max_length=200, choices=CHOICES, default='Driving')
    created=models.DateTimeField(auto_now_add=True)

    def __str__(self):
            
        return f"The {self.travel_mode} time is {self.travelling_time} minute(s)."

class WaitTime(models.Model):
    address=models.CharField(max_length=200)
    wait_time=models.IntegerField()
    created=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Wait time is {self.wait_time} min."

