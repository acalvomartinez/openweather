// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ForecastManaged.m instead.

#import "_ForecastManaged.h"

const struct ForecastManagedAttributes ForecastManagedAttributes = {
	.date = @"date",
	.humidity = @"humidity",
	.icon = @"icon",
	.maxTemperature = @"maxTemperature",
	.minTemperature = @"minTemperature",
	.pressure = @"pressure",
	.weatherCondition = @"weatherCondition",
};

const struct ForecastManagedRelationships ForecastManagedRelationships = {
	.actualweather = @"actualweather",
};

@implementation ForecastManagedID
@end

@implementation _ForecastManaged

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Forecast" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Forecast";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Forecast" inManagedObjectContext:moc_];
}

- (ForecastManagedID*)objectID {
	return (ForecastManagedID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

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

	return keyPaths;
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

@dynamic weatherCondition;

@dynamic actualweather;

@end

