// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WatchStore.m instead.

#import "_WatchStore.h"

const struct WatchStoreAttributes WatchStoreAttributes = {
	.address = @"address",
	.city = @"city",
	.credits = @"credits",
	.descriptionResourceURL = @"descriptionResourceURL",
	.descriptionText = @"descriptionText",
	.district = @"district",
	.fax = @"fax",
	.foundTime = @"foundTime",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.name = @"name",
	.phone = @"phone",
	.postcode = @"postcode",
	.province = @"province",
	.registerTime = @"registerTime",
	.storeIdentifier = @"storeIdentifier",
	.summaryRate = @"summaryRate",
	.version = @"version",
	.website = @"website",
	.weibo = @"weibo",
};

const struct WatchStoreRelationships WatchStoreRelationships = {
	.watches = @"watches",
};

const struct WatchStoreFetchedProperties WatchStoreFetchedProperties = {
};

@implementation WatchStoreID
@end

@implementation _WatchStore

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WatchStore" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WatchStore";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WatchStore" inManagedObjectContext:moc_];
}

- (WatchStoreID*)objectID {
	return (WatchStoreID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"creditsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"credits"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"storeIdentifierValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"storeIdentifier"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"summaryRateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"summaryRate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"versionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"version"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic address;






@dynamic city;






@dynamic credits;



- (float)creditsValue {
	NSNumber *result = [self credits];
	return [result floatValue];
}

- (void)setCreditsValue:(float)value_ {
	[self setCredits:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveCreditsValue {
	NSNumber *result = [self primitiveCredits];
	return [result floatValue];
}

- (void)setPrimitiveCreditsValue:(float)value_ {
	[self setPrimitiveCredits:[NSNumber numberWithFloat:value_]];
}





@dynamic descriptionResourceURL;






@dynamic descriptionText;






@dynamic district;






@dynamic fax;






@dynamic foundTime;






@dynamic latitude;






@dynamic longitude;






@dynamic name;






@dynamic phone;






@dynamic postcode;






@dynamic province;






@dynamic registerTime;






@dynamic storeIdentifier;



- (int32_t)storeIdentifierValue {
	NSNumber *result = [self storeIdentifier];
	return [result intValue];
}

- (void)setStoreIdentifierValue:(int32_t)value_ {
	[self setStoreIdentifier:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStoreIdentifierValue {
	NSNumber *result = [self primitiveStoreIdentifier];
	return [result intValue];
}

- (void)setPrimitiveStoreIdentifierValue:(int32_t)value_ {
	[self setPrimitiveStoreIdentifier:[NSNumber numberWithInt:value_]];
}





@dynamic summaryRate;



- (float)summaryRateValue {
	NSNumber *result = [self summaryRate];
	return [result floatValue];
}

- (void)setSummaryRateValue:(float)value_ {
	[self setSummaryRate:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveSummaryRateValue {
	NSNumber *result = [self primitiveSummaryRate];
	return [result floatValue];
}

- (void)setPrimitiveSummaryRateValue:(float)value_ {
	[self setPrimitiveSummaryRate:[NSNumber numberWithFloat:value_]];
}





@dynamic version;



- (int16_t)versionValue {
	NSNumber *result = [self version];
	return [result shortValue];
}

- (void)setVersionValue:(int16_t)value_ {
	[self setVersion:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveVersionValue {
	NSNumber *result = [self primitiveVersion];
	return [result shortValue];
}

- (void)setPrimitiveVersionValue:(int16_t)value_ {
	[self setPrimitiveVersion:[NSNumber numberWithShort:value_]];
}





@dynamic website;






@dynamic weibo;






@dynamic watches;

	
- (NSMutableSet*)watchesSet {
	[self willAccessValueForKey:@"watches"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"watches"];
  
	[self didAccessValueForKey:@"watches"];
	return result;
}
	






@end
