# OpenWeather
##Code Challenge


El ejercicio consiste en crear una aplicación iOS (Objective-C/Swift) que nos permita obtener el tiempo actual, junto al pronóstico para los próximos cinco días, a partir de nuestra localización. Para ello se hará uso de OpenWeather API (http://openweathermap.org/API). Los resultados serán listado en una tabla y deben de ser accesibles incluso cuando no haya conexión a la red (puedes hacer uso del mecanismo de persistencia que prefieras). Se valorará también la correcta gestión de errores y cualquier función adicional.
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
sys
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
{"city":{"id":1851632,"name":"Shuzenji",
"coord":{"lon":138.933334,"lat":34.966671},
"country":"JP",
"cod":"200",
"message":0.0045,
"cnt":38,
"list":[{
        "dt":1406106000,
        "main":{
            "temp":298.77,
            "temp_min":298.77,
            "temp_max":298.774,
            "pressure":1005.93,
            "sea_level":1018.18,
            "grnd_level":1005.93,
            "humidity":87
            "temp_kf":0.26},
        "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],
        "clouds":{"all":88},
        "wind":{"speed":5.71,"deg":229.501},
        "sys":{"pod":"d"},
        "dt_txt":"2014-07-23 09:00:00"}
        ]}
```

Parameters:

* **code** Internal parameter
* **message** Internal parameter
* **city**
	* city.id City ID
	* city.name City name
	* city.coord
		* city.coord.lat City geo location, latitude
		* city.coord.lon City geo location, longitude
	* city.country Country code (GB, JP etc.)
* **cnt** Number of lines returned by this API call
* **list**
	* list.dt Time of data forecasted, unix, UTC
	* list.main
		* list.main.temp Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.main.temp_min Minimum temperature at the moment of calculation. This is deviation from 'temp' that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.main.temp_max Maximum temperature at the moment of calculation. This is deviation from 'temp' that is possible for large cities and megalopolises geographically expanded (use these parameter optionally). Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
		* list.main.pressure Atmospheric pressure on the sea level by default, hPa
		* list.main.sea_level Atmospheric pressure on the sea level, hPa
		* list.main.grnd_level Atmospheric pressure on the ground level, hPa
		* list.main.humidity Humidity, %
		* list.main.temp_kf Internal parameter
	* list.weather (more info Weather condition codes)
		* list.weather.id Weather condition id
		* list.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
		* list.weather.description Weather condition within the group
		* list.weather.icon Weather icon id
	* list.clouds
		* list.clouds.all Cloudiness, %
	* list.wind
		* list.wind.speed Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
		* list.wind.deg Wind direction, degrees (meteorological)
	* list.rain
		* list.rain.3h Rain volume for last 3 hours, mm
	* list.snow
		* list.snow.3h Snow volume for last 3 hours
	* list.dt_txt Data/time of caluclation, UTC
