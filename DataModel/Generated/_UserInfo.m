// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserInfo.m instead.

#import "_UserInfo.h"

const struct UserInfoAttributes UserInfoAttributes = {
	.autoRegister = @"autoRegister",
	.password = @"password",
	.username = @"username",
};

const struct UserInfoRelationships UserInfoRelationships = {
};

const struct UserInfoFetchedProperties UserInfoFetchedProperties = {
};

@implementation UserInfoID
@end

@implementation _UserInfo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserInfo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserInfo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:moc_];
}

- (UserInfoID*)objectID {
	return (UserInfoID*)[super objectID];
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
