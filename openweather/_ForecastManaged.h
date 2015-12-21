// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ForecastManaged.h instead.

#import <CoreData/CoreData.h>

extern const struct ForecastManagedAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *humidity;
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *maxTemperature;
	__unsafe_unretained NSString *minTemperature;
	__unsafe_unretained NSString *pressure;
	__unsafe_unretained NSString *weatherCondition;
} ForecastManagedAttributes;

extern const struct ForecastManagedRelationships {
	__unsafe_unretained NSString *actualweather;
} ForecastManagedRelationships;

@class ActualWeatherManaged;

@interface ForecastManagedID : NSManagedObjectID {}
@end

@interface _ForecastManaged : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ForecastManagedID* objectID;

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

@property (nonatomic, strong) NSString* weatherCondition;

//- (BOOL)validateWeatherCondition:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ActualWeatherManaged *actualweather;

//- (BOOL)validateActualweather:(id*)value_ error:(NSError**)error_;

@end

@interface _ForecastManaged (CoreDataGeneratedPrimitiveAccessors)

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

- (NSString*)primitiveWeatherCondition;
- (void)setPrimitiveWeatherCondition:(NSString*)value;

- (ActualWeatherManaged*)primitiveActualweather;
- (void)setPrimitiveActualweather:(ActualWeatherManaged*)value;

@end
