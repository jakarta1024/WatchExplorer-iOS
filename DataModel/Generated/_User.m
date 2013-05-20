// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.autoRegister = @"autoRegister",
	.password = @"password",
	.username = @"username",
};

const struct UserRelationships UserRelationships = {
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"autoRegisterValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"autoRegister"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic autoRegister;



- (BOOL)autoRegisterValue {
	NSNumber *result = [self autoRegister];
	return [result boolValue];
}

- (void)setAutoRegisterValue:(BOOL)value_ {
	[self setAutoRegister:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAutoRegisterValue {
	NSNumber *result = [self primitiveAutoRegister];
	return [result boolValue];
}

- (void)setPrimitiveAutoRegisterValue:(BOOL)value_ {
	[self setPrimitiveAutoRegister:[NSNumber numberWithBool:value_]];
}





@dynamic password;






@dynamic username;











@end
