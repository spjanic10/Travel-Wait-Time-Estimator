
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.template import Context, loader
import googlemaps
import requests, json
import psycopg2
from django.db import connections
from geopy.geocoders import GoogleV3
from decouple import config

import datetime
import pyowm
from sklearn.linear_model import LinearRegression
import numpy as np

import sys
import tweepy
import re
from array import *

from django.shortcuts import render,get_object_or_404
from .models import TravelTime, WaitTime
from .forms import TravelTimeModelForm

API_key = config('GOOGLE_MAPS_KEY')
gmaps = googlemaps.Client(key=API_key)



url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'

mobile_uas = [
	'w3c ','acs-','alav','alca','amoi','audi','avan','benq','bird','blac',
	'blaz','brew','cell','cldc','cmd-','dang','doco','eric','hipt','inno',
	'ipaq','java','jigs','kddi','keji','leno','lg-c','lg-d','lg-g','lge-',
	'maui','maxo','midp','mits','mmef','mobi','mot-','moto','mwbp','nec-',
	'newt','noki','oper','palm','pana','pant','phil','play','port','prox',
	'qwap','sage','sams','sany','sch-','sec-','send','seri','sgh-','shar',
	'sie-','siem','smal','smar','sony','sph-','symb','t-mo','teli','tim-',
	'tosh','tsm-','upg1','upsi','vk-v','voda','wap-','wapa','wapi','wapp',
	'wapr','webc','winw','winw','xda','xda-'
	]
mobile_ua_hints = [ 'SymbianOS', 'Opera Mini', 'iPhone', 'Android' ]


# Create your views here.
def calculate_time_view(request):


    form=TravelTimeModelForm(request.POST or None)
    
    obj_wait=''
    obj_travel=''
    latitude=43.65362618163458
    longitude=-79.3840793723362
    waitDestination=''
    time_only=''
    error_message=''
    delay=''

    try:
        if form.is_valid():
            instance=form.save(commit=False)
            instance.destination=form.cleaned_data.get('destination')
            instance.location=form.cleaned_data.get('location')
            instance.travel_mode=form.cleaned_data.get('travel_mode')
            

            r = requests.get(url + 'units=metric' + '&origins=' + instance.location.replace(" ", "+") + '&destinations=' + instance.destination.replace(" ", "+") + '&mode=' + instance.travel_mode + '&key=' + API_key)
            
            x = r.json()

            waitDestination=str(x['destination_addresses'][0])
            

            instance.travelling_time=int(int(x['rows'][0]['elements'][0]['duration']['value'])/60)
            
            
            
            sql="""SELECT time FROM locations.locations WHERE address=%s;"""
            
            with connections['hospital'].cursor() as cursor:
                cursor.execute(sql,(waitDestination, ))
                results=cursor.fetchall()

            if results:
                
                obj_wait = 'The wait time is '+str(int(((results[0])[0])*60))+' minute(s).'
                time_only=str(int(((results[0])[0])*60))

            else:
                obj_wait='This destination is not in our wait time database.'
            obj_travel=str(instance)

            geolocator=GoogleV3(api_key=API_key)
            location=geolocator.geocode(waitDestination)
            latitude=location.latitude
            longitude=location.longitude
            
            
            
            
            if instance.travel_mode=='transit':
                TTC_alert(GetTTCStatus())
                YRT_alert(GetYRTStatus())
                delay1=CheckDelay(instance.location.replace(" ", "+"),instance.destination.replace(" ", "+"),instance.travel_mode)
                for i in delay1:
                    obj_travel=obj_travel+i
                
            elif instance.travel_mode=='driving':

                multiplier=weather_multiplier(fetch_weather(latitude, longitude))

                distance=int(int(x['rows'][0]['elements'][0]['distance']['value']))
                prediction=linear_predict(distance, instance.travelling_time*60)
                if prediction[1]<0.9:
                    pass
                else:
                    instance.travel_time=multiplier*prediction[0]

            instance.save()
    except Exception as e:
        error_message="One of the locations you entered seems to be invalid. Please try again."
        print(e)


     


    context = {
        'travel_time': obj_travel,
        'wait_time': obj_wait,
        'form': form,
        'destination_address': waitDestination,
        'lat': latitude,
        'lng': longitude,
        'time_only':time_only,
        'error_msg': error_message,
        'delay': delay,

    }
    if mobileBrowser(request):
        t = render(request, 'polls/m_main.html', context)
    else:
        t = render(request, 'polls/main.html', context)

    return t

def linear_predict(distance,travel_time1):
    with connections['hospital'].cursor() as cur:
        
        sql = """SELECT distance,travel FROM locations.driving;"""
        cur.execute(sql)
        data = cur.fetchall()
        i = 0
        X = np.array([])
        y = np.array([])
        for x in data:
            i = i + 1
            X = np.append(X,[x[0]])
            y = np.append(y,[x[1]])

        X = np.reshape(X, (i,1))
        y = np.reshape(y, (i,1))
        
        reg = LinearRegression().fit(X,y)
        accuracy1 = reg.score(X,y)
        

        sql1 = """INSERT INTO locations.driving (distance,travel,accuracy)
            VALUES (%s,%s,%s);"""

        cur.execute(sql1, (distance, travel_time1, accuracy1))
        
        result1=[(((reg.predict(np.array([[distance]]))).astype(float))[0][0]), accuracy1]
        
        
        
    return result1
def mobileBrowser(request):
    ''' Super simple device detection, returns True for mobile devices '''
 
    mobile_browser = False
    ua = request.META['HTTP_USER_AGENT'].lower()[0:4]
 
    if (ua in mobile_uas):
        mobile_browser = True
    else:
        for hint in mobile_ua_hints:
            if request.META['HTTP_USER_AGENT'].find(hint) > 0:
                mobile_browser = True
 
    return mobile_browser

def fetch_weather(lat, lng):
    owm_API_key = '4e840016c83db9750a0ddb88e28c78d6'
    owm = pyowm.OWM(owm_API_key)
    # manager = owm.weather_manager()
    observation = owm.weather_at_coords(lat, lng)
    w = observation.get_weather()
    # temperature = observation.temperature('celsius')
    status = w.get_detailed_status()

    return status

def weather_multiplier(status):
	switcher1 = {
		"thunderstorm with light rain":1.041,
		"thunderstorm with rain":1.041,
		"thunderstorm with heavy rain":1.105,
		"light thunderstorm":1,
		"thunderstorm":1,
		"heavy thunderstorm":1,
		"ragged thunderstorm":1,
		"thunderstorm with light drizzle":1.041,
		"thunderstorm with drizzle":1.041,
		"thunderstorm with heavy drizzle":1.105,
		"light intensity drizzle":1,
		"drizzle":1,
		"heavy intensity drizzle":1.041,
		"light intensity drizzle rain":1,
		"drizzle rain":1.041,
		"heavy intensity drizzle rain":1.041,
		"shower rain and drizzle":1.041,
		"heavy shower rain and drizzle":1.105,
		"shower drizzle":1.041,
		"light rain":1.041,
		"moderate rain":1.041,
		"heavy intensity rain":1.105,
		"very heavy rain":1.105,
		"extreme rain":1.105,
		"freezing rain":1.105,
		"light intensity shower rain":1,
		"shower rain":1.041,
		"heavy intensity shower rain":1.041,
		"ragged shower rain":1.041,
		"light snow":1.195,
		"snow":1.195,
		"heavy snow":1.986,
		"sleet":1.195,
		"light shower sleet":1.195,
		"shower sleet":1.195,
		"light rain and snow":1.195,
		"rain and snow":1.195,
		"light shower snow":1.195,
		"shower snow":1.195,
		"heavy shower snow":1.986
	}
	switcher2 = {
		"thunderstorm with light rain":1.2754,
		"thunderstorm with rain":1.2754,
		"thunderstorm with heavy rain":1.6324,
		"light thunderstorm":1,
		"thunderstorm":1,
		"heavy thunderstorm":1,
		"ragged thunderstorm":1,
		"thunderstorm with light drizzle":1.2754,
		"thunderstorm with drizzle":1.2754,
		"thunderstorm with heavy drizzle":1.6324,
		"light intensity drizzle":1,
		"drizzle":1,
		"heavy intensity drizzle":1.2754,
		"light intensity drizzle rain":1,
		"drizzle rain":1.2754,
		"heavy intensity drizzle rain":1.2754,
		"shower rain and drizzle":1.2754,
		"heavy shower rain and drizzle":1.6324,
		"shower drizzle":1.2754,
		"light rain":1.2754,
		"moderate rain":1.2754,
		"heavy intensity rain":1.6324,
		"very heavy rain":1.6324,
		"extreme rain":1.6324,
		"freezing rain":1.6324,
		"light intensity shower rain":1,
		"shower rain":1.2754,
		"heavy intensity shower rain":1.2754,
		"ragged shower rain":1.2754,
		"light snow":1.4428,
		"snow":1.4428,
		"heavy snow":2.6242,
		"sleet":1.4428,
		"light shower sleet":1.4428,
		"shower sleet":1.4428,
		"light rain and snow":1.4428,
		"rain and snow":1.4428,
		"light shower snow":1.4428,
		"shower snow":1.4428,
		"heavy shower snow":2.6242
	}
	switcher3 = {
		"thunderstorm with light rain":1.07,
		"thunderstorm with rain":1.07,
		"thunderstorm with heavy rain":1.255,
		"light thunderstorm":1,
		"thunderstorm":1,
		"heavy thunderstorm":1,
		"ragged thunderstorm":1,
		"thunderstorm with light drizzle":1.07,
		"thunderstorm with drizzle":1.07,
		"thunderstorm with heavy drizzle":1.255,
		"light intensity drizzle":1,
		"drizzle":1,
		"heavy intensity drizzle":1.07,
		"light intensity drizzle rain":1,
		"drizzle rain":1.07,
		"heavy intensity drizzle rain":1.07,
		"shower rain and drizzle":1.07,
		"heavy shower rain and drizzle":1.255,
		"shower drizzle":1.07,
		"light rain":1.07,
		"moderate rain":1.07,
		"heavy intensity rain":1.255,
		"very heavy rain":1.255,
		"extreme rain":1.255,
		"freezing rain":1.255,
		"light intensity shower rain":1,
		"shower rain":1.07,
		"heavy intensity shower rain":1.07,
		"ragged shower rain":1.07,
		"light snow":1.136,
		"snow":1.136,
		"heavy snow":1.59,
		"sleet":1.136,
		"light shower sleet":1.136,
		"shower sleet":1.136,
		"light rain and snow":1.136,
		"rain and snow":1.136,
		"light shower snow":1.136,
		"shower snow":1.136,
		"heavy shower snow":1.59
	}
	switcher4 = {
		"thunderstorm with light rain":1.143,
		"thunderstorm with rain":1.143,
		"thunderstorm with heavy rain":1.3348,
		"light thunderstorm":1,
		"thunderstorm":1,
		"heavy thunderstorm":1,
		"ragged thunderstorm":1,
		"thunderstorm with light drizzle":1.143,
		"thunderstorm with drizzle":1.143,
		"thunderstorm with heavy drizzle":1.3348,
		"light intensity drizzle":1,
		"drizzle":1,
		"heavy intensity drizzle":1.143,
		"light intensity drizzle rain":1,
		"drizzle rain":1.143,
		"heavy intensity drizzle rain":1.143,
		"shower rain and drizzle":1.143,
		"heavy shower rain and drizzle":1.3348,
		"shower drizzle":1.143,
		"light rain":1.143,
		"moderate rain":1.143,
		"heavy intensity rain":1.3348,
		"very heavy rain":1.3348,
		"extreme rain":1.3348,
		"freezing rain":1.3348,
		"light intensity shower rain":1,
		"shower rain":1.143,
		"heavy intensity shower rain":1.143,
		"ragged shower rain":1.143,
		"light snow":1.19,
		"snow":1.19,
		"heavy snow":1.5254,
		"sleet":1.19,
		"light shower sleet":1.19,
		"shower sleet":1.19,
		"light rain and snow":1.19,
		"rain and snow":1.19,
		"light shower snow":1.19,
		"shower snow":1.19,
		"heavy shower snow":1.5254
	}
	current_time = datetime.datetime.now()
	if current_time.hour >= 0 and current_time.hour < 6:
		return switcher1.get(status, 1)
	if current_time.hour >= 19 and current_time.hour <= 23:
		return switcher1.get(status, 1)
	if current_time.hour >= 6 and current_time.hour < 9:
		return switcher2.get(status, 1)
	if current_time.hour >= 9 and current_time.hour < 15:
		return switcher3.get(status, 1)
	if current_time.hour >= 15 and current_time.hour < 19:
		return switcher4.get(status, 1)

def TTC_alert(status):
    
        with connections['hospital'].cursor() as cur:
            j=0
            sql = """TRUNCATE TABLE locations.ttc;"""
            cur.execute(sql)

            for i in status:
                j = j + 1
                date = (i[0].split(', '))[0]
                time = (i[0].split(', '))[1]
                condition_full = i[1].split(': ')
                if len(condition_full) > 1:
                    condition = (i[1].split(': '))[0]
                    condition_time = int((i[1].split(': '))[1].replace(' minutes', ''))/60
                else:
                    condition = (i[1].split(': '))[0]
                    condition_time = None
                full_route =(i[2].split(' : '))
                route = full_route[0]
                short_line = str([int(s) for s in route.split() if s.isdigit()])
                if len(full_route) > 1:
                    if " and " in full_route[1]:
                        start = (full_route[1].split(' and '))[0]
                        end = (full_route[1].split(' and '))[1]
                        #print(j, end)
                    elif " to " in full_route[1]:
                        start = (full_route[1].split(' to '))[0]
                        end = (full_route[1].split(' to '))[1]
                        #print(j, end)
                    else:
                        start = full_route[1]
                        end = None
                        #print(j, end)
                else:
                    pass
                tweet = [j, date, time, condition, condition_time, route, start, end, short_line]

                sql = """INSERT INTO locations.ttc (id, date, time, condition, delay, line, start, ending, short_line)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"""

                cur.execute(sql, (tweet[0], tweet[1], tweet[2], tweet[3], tweet[4], tweet[5], tweet[6], tweet[7], tweet[8]))
    

def GetLocationEndPoint(TweetString, start):
    #Common delimeters in the specific location substring
    end = TweetString.find(' while ')
    if(end == -1):
        end = TweetString.find(' due ')
        if(end  == -1):
            end = TweetString.find('.')
            if(end < start):
                end = len(TweetString)

    return end

def GetTTCTweetLocation(TweetString):

    #Set Initial Location
    location = ''

    #Remove TTC Update substring
    if((TweetString.find('UPDATE:') > -1) or (TweetString.find('Update:') > -1)):
        TweetString = TweetString[8:-1]

    #Start at String Index 0
    start = 0
    end = 0

    #Remove Additional Spaces of Substring
    for i in range(0, len(TweetString)):
        if(TweetString[i] != ' '):
            TweetString = TweetString[i:]
            break


    #Look for Keyword in Tweet
    keywords = [' at ', ' between ', ' near ', ' via ', ' from ']

    for keyword in keywords:

        match = TweetString.find(keyword)
        if(match > -1):
            if keyword == ' between ':
                start = TweetString.find(' between ') + 9
                end = GetLocationEndPoint(TweetString = TweetString, start = start)
                break

            if keyword == ' at ':
                start = TweetString.find(' at ') + 4
                end = GetLocationEndPoint(TweetString = TweetString, start = start)
                break

            if keyword == ' near ':
                start = TweetString.find(' near ') + 6
                end = GetLocationEndPoint(TweetString = TweetString, start = start)
                break

            if keyword == ' via ':
                start = TweetString.find(' via ') + 5
                end = GetLocationEndPoint(TweetString = TweetString, start = start)
                break

            if keyword == ' from ':
                start = TweetString.find(' from ') + 6
                end = GetLocationEndPoint(TweetString = TweetString, start = start)
                break

    #Check if a specific location is found
    if(start < end):
        SpecificLocation = TweetString[start : end]
    else:
        SpecificLocation = ''

    #Get Main Route Path
    keywords = [r'continues to', r':']
    for keyword in keywords:
        end = TweetString.find(keyword)
        if(end > -1):
            if keyword == keywords[1]:
                location = TweetString[0 : end]
            else:
                location = TweetString[0 : end - 1]
            break



    #Did not find an exact location thus return route
    if SpecificLocation == '':
        return location
    return location + ' : ' + SpecificLocation



def GetTTCTweetStatus(TweetString):
    keywords = ['Delay', 'Resume', 'No Service', 'Detour', 'Collision']

    #Look for Keywords in Tweet
    for keyword in keywords:
        match = re.search(keyword, TweetString, re.IGNORECASE)
        if match:
            match = re.search(r'\d\d minutes', TweetString, re.IGNORECASE)
            if match:
                return (keyword + ': ' + match.group())
            else:
                return keyword

    return ''

def GetTTCStatus():
    #Define Constants
    CONSUMER_KEY = config('CONSUMER_KEY')
    CONSUMER_SECRET = config('CONSUMER_SECRET')
    ACCESS_TOKEN = config('ACCESS_TOKEN')
    ACCESS_TOKEN_SECRET = config('ACCESS_TOKEN_SECRET')

    #Connect to API
    auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
    api = tweepy.API(auth)

    #User Information
    username = r'TTCnotices'
    count = 50
    page = 1

    #GetTweets
    i = 1
    j = 1
    tweets_index = []
    tweets_delay = []
    tweets_delaytime = []
    tweets_location = []
    tweets_date = []
    tweets_text = []

    while True:
        if(i <= page):

            tweets = api.user_timeline(id = username, count = count, page = page, tweet_mode = 'extended')
            for tweet in tweets:
                #Print to console Index, Time, and Tweet
                #print(str(j) + '. \t{' + str(tweet.created_at) + ' }\t' + tweet.full_text)
                tweets_index.append(j)


                #Get Time Zone Right
                time = tweet.created_at.strftime('%H')
                time = int(time)
                time = (time - 5)%24
                time = str(time)
                #tweets_date.append(tweet.created_at.strftime(time + ':%M:%S'))
                tweets_date.append(tweet.created_at.strftime('%m/%d/%Y, '+ time + ':%M:%S'))

                tweets_delay.append(GetTTCTweetStatus(tweet.full_text))
                if(tweets_delay[-1] == ''):
                    tweets_location.append('')
                else:
                    tweets_location.append(GetTTCTweetLocation(tweet.full_text))
                tweets_text.append(tweet.full_text)

                #Increment Tweet Index
                j += 1

            #Increment Page Index
            i += 1
        else:
            break

    #Store Info to Excel Spreadsheet
    #d = {'Index' : tweets_index, 'Date' : tweets_date, 'Status' : tweets_delay, 'Location': tweets_location, 'Text' : tweets_text}
    #df = pd.DataFrame(data = d, columns = ['Index', 'Date', 'Status', 'Location', 'Text'])
    #df.to_excel('Book1.xlsx')

    #Object to return to main
    ReturnObject = []

    #Return time, status flag, and location
    for i in range(0, len(tweets_delay) - 1):
        if tweets_delay[i] != '':
            ReturnObject.append([tweets_date[i], tweets_delay[i], tweets_location[i]])

    return ReturnObject

def YRT_alert(status):
   
        with connections['hospital'].cursor() as cur:
            j=0
            sql = """TRUNCATE TABLE locations.yrt;"""
            cur.execute(sql)
            for i in status:
                j = j + 1
                date = (i[0].split(', '))[0]
                time = (i[0].split(', '))[1]
                condition_full = i[1].split(': ')
                if len(condition_full) > 1:
                    condition = (i[1].split(': '))[0]
                    condition_time = int((i[1].split(': '))[1].replace(' minutes', ''))/60
                else:
                    condition = (i[1].split(': '))[0]
                    condition_time = None
                full_route =(i[2].split(' : '))
                route = full_route[0]
                short_line = str([int(s) for s in route.split() if s.isdigit()])
                if len(full_route) > 1:
                    if " and " in full_route[1]:
                        start = (full_route[1].split(' and '))[0]
                        end = (full_route[1].split(' and '))[1]
                        #print(j, end)
                    elif " to " in full_route[1]:
                        start = (full_route[1].split(' to '))[0]
                        end = (full_route[1].split(' to '))[1]
                        #print(j, end)
                    else:
                        start = full_route[1]
                        end = None
                        #print(j, end)
                else:
                    start = None
                    end = None
                    pass
                tweet = [j, date, time, condition, condition_time, route, start, end, short_line]

                sql = """INSERT INTO locations.yrt (id, date, time, condition, delay, line, start, ending, short_line)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"""

                cur.execute(sql, (tweet[0], tweet[1], tweet[2], tweet[3], tweet[4], tweet[5], tweet[6], tweet[7], tweet[8]))
   

def GetLocationEndPointYRT(TweetString, start):
    #Common delimeters in the specific location substring
    end = TweetString.find(' while ')
    if(end == -1):
        end = TweetString.find(' due ')
        if(end  == -1):
            end = TweetString.find('.')
            if(end < start):
                end = len(TweetString)
    
    return end

def GetYRTTweetLocation(TweetString):
    
    #Set Initial Location
    location = ''

    #Remove TTC Update substring
    if(TweetString.find('#RiderAlert') > -1):
        TweetString = TweetString[len('#RiderAlert'):-1]
    
    #Start at String Index 0
    start = 0
    end = 0
    
    #Remove Additional Spaces of Substring
    for i in range(0, len(TweetString)):
        if(TweetString[i] != ' '):
            TweetString = TweetString[i:]
            break

    
    #Look for Keyword in Tweet
    keywords = [' at ', ' between ', ' near ', ' via ', ' from ']

    for keyword in keywords:
        
        match = TweetString.find(keyword)
        if(match > -1):
            if keyword == ' between ':
                start = TweetString.find(' between ') + 9
                end = GetLocationEndPointYRT(TweetString = TweetString, start = start)
                break
            
            if keyword == ' at ':
                start = TweetString.find(' at ') + 4
                end = GetLocationEndPointYRT(TweetString = TweetString, start = start)
                break

            if keyword == ' near ':
                start = TweetString.find(' near ') + 6
                end = GetLocationEndPointYRT(TweetString = TweetString, start = start)
                break

            if keyword == ' via ':
                start = TweetString.find(' via ') + 5
                end = GetLocationEndPointYRT(TweetString = TweetString, start = start)
                break
            
            if keyword == ' from ':
                start = TweetString.find(' from ') + 6
                end = GetLocationEndPointYRT(TweetString = TweetString, start = start)
                break
    
    #Check if a specific location is found
    if(start < end):
        SpecificLocation = TweetString[start : end]
    else:
        SpecificLocation = ''

    #Get Main Route Path
    keywords = [r'trip', r'detour is', r'is detouring', r'are detouring', r'detours are', r'on detour', r'is experiencing']
    for keyword in keywords:
        end = TweetString.find(keyword)
        if(end > -1):
            location = TweetString[0 : end - 1] 
            break

    locationlist = list(location)
    for i in range(0 , len(locationlist)):
        value = ord(locationlist[i])
        if(value > 127):
            locationlist[i] = ''

    location = ''.join(locationlist)
    #Did not find an exact location thus return route
    if SpecificLocation == '':
        return location            
    return location + ' : ' + SpecificLocation

def GetYRTTweetStatus(TweetString):

    find = TweetString.find('#RiderAlert ')
    if(find < 0):
        return ''
    else:
        TweetString = TweetString[find + 12:]

    keywords = ['Delay', 'Resume', 'Detour', 'No Service', 'Collision']

    #Look for Keywords in Tweet
    for keyword in keywords:
        match = re.search(keyword, TweetString, re.IGNORECASE)
        if match:
            match = re.search(r'\d\d minutes', TweetString, re.IGNORECASE)
            if match:
                return (keyword + ': ' + match.group())
            else:
                match = re.search(r'\d\d min', TweetString, re.IGNORECASE)
                if match:
                    return (keyword + ': ' + match.group() + 'utes')
                else:
                    return keyword
    
    return ''

def GetYRTStatus():
    #Define Constants
    CONSUMER_KEY = config('CONSUMER_KEY')
    CONSUMER_SECRET = config('CONSUMER_SECRET')
    ACCESS_TOKEN = config('ACCESS_TOKEN')
    ACCESS_TOKEN_SECRET = config('ACCESS_TOKEN_SECRET')

    #Connect to API
    auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
    api = tweepy.API(auth)

    #User Information
    username = r'YRTViva'
    count = 50
    page = 1

    #GetTweets 
    i = 1
    j = 1
    tweets_index = []
    tweets_delay = []
    tweets_delaytime = []
    tweets_location = []
    tweets_date = []
    tweets_text = []

    while True:
        if(i <= page):

            tweets = api.user_timeline(id = username, count = count, page = page, tweet_mode = 'extended')
            for tweet in tweets:
                #Print to console Index, Time, and Tweet
                #print(str(j) + '. \t{' + str(tweet.created_at) + ' }\t' + tweet.full_text)
                tweets_index.append(j)

                
                # #Get Time Zone Right
                time = tweet.created_at.strftime('%H')
                time = int(time)
                time = (time - 5)%24
                time = str(time)
                #tweets_date.append(tweet.created_at.strftime(time + ':%M:%S'))
                tweets_date.append(tweet.created_at.strftime('%m/%d/%Y, '+ time + ':%M:%S'))

                tweets_delay.append(GetYRTTweetStatus(tweet.full_text))
                if(tweets_delay[-1] == ''):
                    tweets_location.append('')
                else:
                    tweets_location.append(GetYRTTweetLocation(tweet.full_text))
                tweets_text.append(tweet.full_text)

                #Increment Tweet Index
                j += 1
            
            #Increment Page Index
            i += 1
        else:
            break

    #Store Info to Excel Spreadsheet
    #d = {'Index' : tweets_index, 'Date' : tweets_date, 'Status' : tweets_delay, 'Location': tweets_location, 'Text' : tweets_text}
    #df = pd.DataFrame(data = d, columns = ['Index', 'Date', 'Status', 'Location', 'Text'])
    #df.to_excel('Book1.xlsx')

    #Object to return to main
    ReturnObject = []

    for i in range(0, len(tweets_delay) - 1):
        if tweets_delay[i] != '':
            ReturnObject.append([tweets_date[i], tweets_delay[i], tweets_location[i]])
    
    return ReturnObject

def CheckDelay(loc,dest,tmode):
    url2='https://maps.googleapis.com/maps/api/directions/json?'
    r = requests.get(url2 + '&origin=' + loc + '&destination=' + dest + '&mode=' + tmode + '&key=' + API_key)
            
    x = r.json()
    

    # fix this 
    # tweets = pd.read_excel('Book1.xlsx', nrows = 30)

    sql="""SELECT condition,delay,line FROM locations.ttc WHERE short_line=%s;"""

    sql_yrt="""SELECT condition,delay,line FROM locations.yrt WHERE short_line=%s;"""
            
            


    num = len(x['routes'][0]['legs'][0]['steps'])
    
    short_line = []
    agency = []
  

    delay=[]

    for i in range(num):
        if x['routes'][0]['legs'][0]['steps'][i]['travel_mode'] == 'TRANSIT':
            short_line.append(x['routes'][0]['legs'][0]['steps'][i]['transit_details']['line']['short_name'])
            agency.append(x['routes'][0]['legs'][0]['steps'][i]['transit_details']['line']['agencies'][0]['name'])
    
    for i in range(len(short_line)):

        line_number='['+str(short_line[i])+']'
        
        if agency[i]=='York Region Transit':
            with connections['hospital'].cursor() as cursor:
                    cursor.execute(sql_yrt,(line_number, ))
                    results_yrt=cursor.fetchall()
                    if str((results_yrt[0])[1]) != 'None':
                        delay.append(' '+str((results_yrt[0])[1])+' minute delay on '+str((results_yrt[0])[2])+'.')
                    

    
        if agency[i]=='TTC':
            with connections['hospital'].cursor() as cursor:
                    cursor.execute(sql,(line_number, ))
                    results=cursor.fetchall()
                    
                    if str((results[0])[1]) != 'None':
                        delay.append(' '+str((results[0])[1])+' minute delay on '+str((results[0])[2])+'.')
                   
        
                
    # print(status)
    # for i in delay:
    #     print(i)
    return delay
        
	# print(condition, time)