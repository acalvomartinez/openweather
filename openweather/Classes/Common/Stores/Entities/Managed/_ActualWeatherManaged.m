// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ActualWeatherManaged.m instead.

#import "_ActualWeatherManaged.h"

const struct ActualWeatherManagedAttributes ActualWeatherManagedAttributes = {
	.cityName = @"cityName",
	.cloudiness = @"cloudiness",
	.date = @"date",
	.humidity = @"humidity",
	.icon = @"icon",
	.maxTemperature = @"maxTemperature",
	.minTemperature = @"minTemperature",
	.pressure = @"pressure",
	.rain3h = @"rain3h",
	.snow3h = @"snow3h",
	.sunrise = @"sunrise",
	.sunset = @"sunset",
	.temperature = @"temperature",
	.weatherCondition = @"weatherCondition",
	.windDirection = @"windDirection",
	.windSpeed = @"windSpeed",
};

const struct ActualWeatherManagedRelationships ActualWeatherManagedRelationships = {
	.forecast = @"forecast",
};

@implementation ActualWeatherManagedID
@end

@implementation _ActualWeatherManaged

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ActualWeather" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ActualWeather";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ActualWeather" inManagedObjectContext:moc_];
}

- (ActualWeatherManagedID*)objectID {
	return (ActualWeatherManagedID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"cloudinessValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cloudiness"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"humidityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"humidity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"maxTemperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"maxTemperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"minTemperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"minTemperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pressureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pressure"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"rain3hValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rain3h"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"snow3hValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"snow3h"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"temperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windDirectionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windDirection"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windSpeedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windSpeed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic cityName;

@dynamic cloudiness;

- (float)cloudinessValue {
	NSNumber *result = [self cloudiness];
	return [result floatValue];
}

- (void)setCloudinessValue:(float)value_ {
	[self setCloudiness:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveCloudinessValue {
	NSNumber *result = [self primitiveCloudiness];
	return [result floatValue];
}

- (void)setPrimitiveCloudinessValue:(float)value_ {
	[self setPrimitiveCloudiness:[NSNumber numberWithFloat:value_]];
}

@dynamic date;

@dynamic humidity;

- (float)humidityValue {
	NSNumber *result = [self humidity];
	return [result floatValue];
}

- (void)setHumidityValue:(float)value_ {
	[self setHumidity:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveHumidityValue {
	NSNumber *result = [self primitiveHumidity];
	return [result floatValue];
}

- (void)setPrimitiveHumidityValue:(float)value_ {
	[self setPrimitiveHumidity:[NSNumber numberWithFloat:value_]];
}

@dynamic icon;

@dynamic maxTemperature;

- (float)maxTemperatureValue {
	NSNumber *result = [self maxTemperature];
	return [result floatValue];
}

- (void)setMaxTemperatureValue:(float)value_ {
	[self setMaxTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveMaxTemperatureValue {
	NSNumber *result = [self primitiveMaxTemperature];
	return [result floatValue];
}

- (void)setPrimitiveMaxTemperatureValue:(float)value_ {
	[self setPrimitiveMaxTemperature:[NSNumber numberWithFloat:value_]];
}

@dynamic minTemperature;

- (float)minTemperatureValue {
	NSNumber *result = [self minTemperature];
	return [result floatValue];
}

- (void)setMinTemperatureValue:(float)value_ {
	[self setMinTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveMinTemperatureValue {
	NSNumber *result = [self primitiveMinTemperature];
	return [result floatValue];
}

- (void)setPrimitiveMinTemperatureValue:(float)value_ {
	[self setPrimitiveMinTemperature:[NSNumber numberWithFloat:value_]];
}

@dynamic pressure;

- (float)pressureValue {
	NSNumber *result = [self pressure];
	return [result floatValue];
}

- (void)setPressureValue:(float)value_ {
	[self setPressure:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePressureValue {
	NSNumber *result = [self primitivePressure];
	return [result floatValue];
}

- (void)setPrimitivePressureValue:(float)value_ {
	[self setPrimitivePressure:[NSNumber numberWithFloat:value_]];
}

@dynamic rain3h;

- (float)rain3hValue {
	NSNumber *result = [self rain3h];
	return [result floatValue];
}

- (void)setRain3hValue:(float)value_ {
	[self setRain3h:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveRain3hValue {
	NSNumber *result = [self primitiveRain3h];
	return [result floatValue];
}

- (void)setPrimitiveRain3hValue:(float)value_ {
	[self setPrimitiveRain3h:[NSNumber numberWithFloat:value_]];
}

@dynamic snow3h;

- (float)snow3hValue {
	NSNumber *result = [self snow3h];
	return [result floatValue];
}

- (void)setSnow3hValue:(float)value_ {
	[self setSnow3h:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveSnow3hValue {
	NSNumber *result = [self primitiveSnow3h];
	return [result floatValue];
}

- (void)setPrimitiveSnow3hValue:(float)value_ {
	[self setPrimitiveSnow3h:[NSNumber numberWithFloat:value_]];
}

@dynamic sunrise;

@dynamic sunset;

@dynamic temperature;

- (float)temperatureValue {
	NSNumber *result = [self temperature];
	return [result floatValue];
}

- (void)setTemperatureValue:(float)value_ {
	[self setTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTemperatureValue {
	NSNumber *result = [self primitiveTemperature];
	return [result floatValue];
}

- (void)setPrimitiveTemperatureValue:(float)value_ {
	[self setPrimitiveTemperature:[NSNumber numberWithFloat:value_]];
}

@dynamic weatherCondition;

@dynamic windDirection;

- (float)windDirectionValue {
	NSNumber *result = [self windDirection];
	return [result floatValue];
}

- (void)setWindDirectionValue:(float)value_ {
	[self setWindDirection:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveWindDirectionValue {
	NSNumber *result = [self primitiveWindDirection];
	return [result floatValue];
}

- (void)setPrimitiveWindDirectionValue:(float)value_ {
	[self setPrimitiveWindDirection:[NSNumber numberWithFloat:value_]];
}

@dynamic windSpeed;

- (float)windSpeedValue {
	NSNumber *result = [self windSpeed];
	return [result floatValue];
}

- (void)setWindSpeedValue:(float)value_ {
	[self setWindSpeed:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveWindSpeedValue {
	NSNumber *result = [self primitiveWindSpeed];
	return [result floatValue];
}

- (void)setPrimitiveWindSpeedValue:(float)value_ {
	[self setPrimitiveWindSpeed:[NSNumber numberWithFloat:value_]];
}

@dynamic forecast;

- (NSMutableSet*)forecastSet {
	[self willAccessValueForKey:@"forecast"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"forecast"];

	[self didAccessValueForKey:@"forecast"];
	return result;
}

@end

