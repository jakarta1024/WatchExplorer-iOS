// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Watch.m instead.

#import "_Watch.h"

const struct WatchAttributes WatchAttributes = {
	.brand = @"brand",
	.commentsCount = @"commentsCount",
	.descriptionText = @"descriptionText",
	.imageCount = @"imageCount",
	.name = @"name",
	.price = @"price",
	.simpleDescription = @"simpleDescription",
	.watchIdentifier = @"watchIdentifier",
};

const struct WatchRelationships WatchRelationships = {
	.store = @"store",
};

const struct WatchFetchedProperties WatchFetchedProperties = {
};

@implementation WatchID
@end

@implementation _Watch

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Watch" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Watch";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Watch" inManagedObjectContext:moc_];
}

- (WatchID*)objectID {
	return (WatchID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"commentsCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"commentsCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"imageCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"imageCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic brand;






@dynamic commentsCount;



- (int32_t)commentsCountValue {
	NSNumber *result = [self commentsCount];
	return [result intValue];
}

- (void)setCommentsCountValue:(int32_t)value_ {
	[self setCommentsCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCommentsCountValue {
	NSNumber *result = [self primitiveCommentsCount];
	return [result intValue];
}

- (void)setPrimitiveCommentsCountValue:(int32_t)value_ {
	[self setPrimitiveCommentsCount:[NSNumber numberWithInt:value_]];
}





@dynamic descriptionText;






@dynamic imageCount;



- (int32_t)imageCountValue {
	NSNumber *result = [self imageCount];
	return [result intValue];
}

- (void)setImageCountValue:(int32_t)value_ {
	[self setImageCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveImageCountValue {
	NSNumber *result = [self primitiveImageCount];
	return [result intValue];
}

- (void)setPrimitiveImageCountValue:(int32_t)value_ {
	[self setPrimitiveImageCount:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic price;



- (int32_t)priceValue {
	NSNumber *result = [self price];
	return [result intValue];
}

- (void)setPriceValue:(int32_t)value_ {
	[self setPrice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result intValue];
}

- (void)setPrimitivePriceValue:(int32_t)value_ {
	[self setPrimitivePrice:[NSNumber numberWithInt:value_]];
}





@dynamic simpleDescription;






@dynamic watchIdentifier;






@dynamic store;

	






@end
