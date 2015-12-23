# OpenWeather
##Code Challenge


An application in Objective C allows access to wheater data and 5 days forecast, using geolocation data. The access to weather service is done throught OpenWeather API (http://openweathermap.org/API). The result will be presented on a tableview. Core Data is used as persistence manager.

###Installing
Run *'pod install'*
##OpenWeatherMap API
###Actual weather by geographical cordinates
<http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139>

Example of API respond:

```
{"coord":
{"lon":145.77,"lat":-16.92},
"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],
"base":"cmc stations",
"main":{"temp":293.25,"pressure":1019,"humidity":83,"temp_min":289.82,"temp_max":295.37},
"wind":{"speed":5.1,"deg":150},
"clouds":{"all":75},
"rain":{"3h":3},
"dt":1435658272,
"sys":{"type":1,"id":8166,"message":0.0166,"country":"AU","sunrise":1435610796,"sunset":1435650870},
"id":2172797,
"name":"Cairns",
"cod":200}
```

Parameters:

* **coord**
	* coord.lon City geo location, longitude
	* coord.lat City geo location, latitude

* **weather** (more info Weather condition codes)
	* weather.id Weather condition id
	* weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
	* weather.description Weather condition within the group
	* weather.icon Weather icon id
* **base** Internal parameter
* **main**
	* main.temp Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
	* main.pressure Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
	* main.humidity Humidity, %
	* main.temp_min Minimum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
	* main.temp_max Maximum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
	* main.sea_level Atmospheric pressure on the sea level, hPa
	* main.grnd_level Atmospheric pressure on the ground level, hPa
* **wind**
	* wind.speed Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
	* wind.deg Wind direction, degrees (meteorological)
* **clouds**
	* clouds.all Cloudiness, %
* **rain**
	* rain.3h Rain volume for the last 3 hours
* **snow**
	* snow.3h Snow volume for the last 3 hours
* **dt** Time of data calculation, unix, UTC
* **sys**
	* sys.type Internal parameter
	* sys.id Internal parameter
	* sys.message Internal parameter
	* sys.country Country code (GB, JP etc.)
	* sys.sunrise Sunrise time, unix, UTC
	* sys.sunset Sunset time, unix, UTC
* **id** City ID
* **name** City name
* **cod** Internal parameter

###5 day / daily forecast data by geographical cordinates
<http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=5>

Example of API respond:

```
{"cod":"200","message":0.0032,
"city":{"id":1851632,"name":"Shuzenji",
"coord":{"lon":138.933334,"lat":34.966671},
"country":"JP"},
"cnt":10,
"list":[{
    "dt":1406080800,
    "temp":{
        "day":297.77,
        "min":293.52,
        "max":297.77,
        "night":293.52,
        "eve":297.77,
        "morn":297.77},
    "pressure":925.04,
    "humidity":76,
    "weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],}
        ]}
```

Parameters:

* **city**
	* city.id City ID
	* city.name City name
	* city.coord
	* city.coord.lat City geo location, latitude
	* city.coord.lon City geo location, longitude
	* city.country Country code (GB, JP etc.)
* **cod** Internal parameter
* **message** Internal parameter
* **cnt** Number of lines returned by this API call
* **list**
	* list.dt Time of data forecasted
	* list.temp
		* list.temp.day Day temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.temp.min Min daily temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.temp.max Max daily temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.temp.night Night temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.temp.eve Evening temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.temp.morn Morning temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
	* list.pressure Atmospheric pressure on the sea level, hPa
	* list.humidity Humidity, %
	* list.weather (more info Weather condition codes)
		* list.weather.id Weather condition id
		* list.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
		* list.weather.description Weather condition within the group
		* list.weather.icon Weather icon id
	* list.speed Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
	* list.deg Wind direction, degrees (meteorological)
	* list.clouds Cloudiness, %