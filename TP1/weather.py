#!/usr/bin/env python
# coding: utf-8

import os
import requests



def get_weather():
    API_KEY = os.environ.get('API_KEY')
    LAT = os.environ.get('LAT')
    LONG = os.environ.get('LONG')
    url = f'https://api.openweathermap.org/data/2.5/weather?lat={LAT}&lon={LONG}&appid={API_KEY}'
    response = requests.get(url)


    if response.status_code == 200:
        weather_data = response.json()
        print(f"The current weather in ({LAT}, {LONG}) is {weather_data['weather'][0]['description']}")
    else:
        print(f"Failed to retrieve weather data: {response.status_code} {response.text}")

    return response.json() 

get_weather()

