# Bath Weather Station Historical Loader

This is a rough script created to simply pull data from the wunderground API for a specific weather station in Bath and load it into
the [BathHacked](http://data.bathhacked.org)

## What is Bath hacked?

As described on [the website](http://www.bathhacked.org/), the objective of BathHacked is very simply...

> We want to free local data and use it to make useful things.

# How to use this script

## Credentials

To run this script, you'll need a collection of credentials:

 * Register as a developer on Wunderground - http://api.wunderground.com/weather/api
 * Signup and request administration rights on data.bathhacked.org
 ** Under your profile select App Token and create a new application
 ***  This will be where your data is stored and gives your app and secure keys

## Setup

Copy or rename the cfg.yml.sample file to cfg.yml and enter all your credentials.

# Run

1. Edit the script and change the two dates that you want to load
2. run ```ruby get_weather_data.rb``` and wait :-)


# References

The data obtained by this script has been published to (Wunderground)[http://www.wunderground.com] by (Paul Wilman)[http://paulwilman.com/] who 
has put together an incredible website. You should totally check it out :-D

## Licensing

Wunderground API used under the (Terms and Conditions)[http://www.wunderground.com/weather/api/d/terms.html] 

<img src="http://icons.wxug.com/logos/JPG/wundergroundLogo_4c_horz.jpg"/>
