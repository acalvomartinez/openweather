// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ForecastManaged.m instead.

#import "_ForecastManaged.h"

const struct ForecastManagedAttributes ForecastManagedAttributes = {
	.date = @"date",
	.icon = @"icon",
	.maxTemperature = @"maxTemperature",
	.minTemperature = @"minTemperature",
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

	return keyPaths;
}

@dynamic date;

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

@dynamic actualweather;

@end

