// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ActualWeatherManaged.h instead.

#import <CoreData/CoreData.h>

extern const struct ActualWeatherManagedAttributes {
	__unsafe_unretained NSString *cityName;
	__unsafe_unretained NSString *cloudiness;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *humidity;
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *maxTemperature;
	__unsafe_unretained NSString *minTemperature;
	__unsafe_unretained NSString *pressure;
	__unsafe_unretained NSString *rain3h;
	__unsafe_unretained NSString *snow3h;
	__unsafe_unretained NSString *sunrise;
	__unsafe_unretained NSString *sunset;
	__unsafe_unretained NSString *temperature;
	__unsafe_unretained NSString *weatherCondition;
	__unsafe_unretained NSString *windDirection;
	__unsafe_unretained NSString *windSpeed;
} ActualWeatherManagedAttributes;

extern const struct ActualWeatherManagedRelationships {
	__unsafe_unretained NSString *forecast;
} ActualWeatherManagedRelationships;

@class ForecastManaged;

@interface ActualWeatherManagedID : NSManagedObjectID {}
@end

@interface _ActualWeatherManaged : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ActualWeatherManagedID* objectID;

@property (nonatomic, strong) NSString* cityName;

//- (BOOL)validateCityName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* cloudiness;

@property (atomic) float cloudinessValue;
- (float)cloudinessValue;
- (void)setCloudinessValue:(float)value_;

//- (BOOL)validateCloudiness:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* humidity;

@property (atomic) float humidityValue;
- (float)humidityValue;
- (void)setHumidityValue:(float)value_;

//- (BOOL)validateHumidity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* icon;

//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* maxTemperature;

@property (atomic) float maxTemperatureValue;
- (float)maxTemperatureValue;
- (void)setMaxTemperatureValue:(float)value_;

//- (BOOL)validateMaxTemperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* minTemperature;

@property (atomic) float minTemperatureValue;
- (float)minTemperatureValue;
- (void)setMinTemperatureValue:(float)value_;

//- (BOOL)validateMinTemperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* pressure;

@property (atomic) float pressureValue;
- (float)pressureValue;
- (void)setPressureValue:(float)value_;

//- (BOOL)validatePressure:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* rain3h;

@property (atomic) float rain3hValue;
- (float)rain3hValue;
- (void)setRain3hValue:(float)value_;

//- (BOOL)validateRain3h:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* snow3h;

@property (atomic) float snow3hValue;
- (float)snow3hValue;
- (void)setSnow3hValue:(float)value_;

//- (BOOL)validateSnow3h:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* sunrise;

//- (BOOL)validateSunrise:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* sunset;

//- (BOOL)validateSunset:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* temperature;

@property (atomic) float temperatureValue;
- (float)temperatureValue;
- (void)setTemperatureValue:(float)value_;

//- (BOOL)validateTemperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* weatherCondition;

//- (BOOL)validateWeatherCondition:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* windDirection;

@property (atomic) float windDirectionValue;
- (float)windDirectionValue;
- (void)setWindDirectionValue:(float)value_;

//- (BOOL)validateWindDirection:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* windSpeed;

@property (atomic) float windSpeedValue;
- (float)windSpeedValue;
- (void)setWindSpeedValue:(float)value_;

//- (BOOL)validateWindSpeed:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *forecast;

- (NSMutableSet*)forecastSet;

@end

@interface _ActualWeatherManaged (ForecastCoreDataGeneratedAccessors)
- (void)addForecast:(NSSet*)value_;
- (void)removeForecast:(NSSet*)value_;
- (void)addForecastObject:(ForecastManaged*)value_;
- (void)removeForecastObject:(ForecastManaged*)value_;

@end

@interface _ActualWeatherManaged (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCityName;
- (void)setPrimitiveCityName:(NSString*)value;

- (NSNumber*)primitiveCloudiness;
- (void)setPrimitiveCloudiness:(NSNumber*)value;

- (float)primitiveCloudinessValue;
- (void)setPrimitiveCloudinessValue:(float)value_;

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveHumidity;
- (void)setPrimitiveHumidity:(NSNumber*)value;

- (float)primitiveHumidityValue;
- (void)setPrimitiveHumidityValue:(float)value_;

- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;

- (NSNumber*)primitiveMaxTemperature;
- (void)setPrimitiveMaxTemperature:(NSNumber*)value;

- (float)primitiveMaxTemperatureValue;
- (void)setPrimitiveMaxTemperatureValue:(float)value_;

- (NSNumber*)primitiveMinTemperature;
- (void)setPrimitiveMinTemperature:(NSNumber*)value;

- (float)primitiveMinTemperatureValue;
- (void)setPrimitiveMinTemperatureValue:(float)value_;

- (NSNumber*)primitivePressure;
- (void)setPrimitivePressure:(NSNumber*)value;

- (float)primitivePressureValue;
- (void)setPrimitivePressureValue:(float)value_;

- (NSNumber*)primitiveRain3h;
- (void)setPrimitiveRain3h:(NSNumber*)value;

- (float)primitiveRain3hValue;
- (void)setPrimitiveRain3hValue:(float)value_;

- (NSNumber*)primitiveSnow3h;
- (void)setPrimitiveSnow3h:(NSNumber*)value;

- (float)primitiveSnow3hValue;
- (void)setPrimitiveSnow3hValue:(float)value_;

- (NSDate*)primitiveSunrise;
- (void)setPrimitiveSunrise:(NSDate*)value;

- (NSDate*)primitiveSunset;
- (void)setPrimitiveSunset:(NSDate*)value;

- (NSNumber*)primitiveTemperature;
- (void)setPrimitiveTemperature:(NSNumber*)value;

- (float)primitiveTemperatureValue;
- (void)setPrimitiveTemperatureValue:(float)value_;

- (NSString*)primitiveWeatherCondition;
- (void)setPrimitiveWeatherCondition:(NSString*)value;

- (NSNumber*)primitiveWindDirection;
- (void)setPrimitiveWindDirection:(NSNumber*)value;

- (float)primitiveWindDirectionValue;
- (void)setPrimitiveWindDirectionValue:(float)value_;

- (NSNumber*)primitiveWindSpeed;
- (void)setPrimitiveWindSpeed:(NSNumber*)value;

- (float)primitiveWindSpeedValue;
- (void)setPrimitiveWindSpeedValue:(float)value_;

- (NSMutableSet*)primitiveForecast;
- (void)setPrimitiveForecast:(NSMutableSet*)value;

@end
