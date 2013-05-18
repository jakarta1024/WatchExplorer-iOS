// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserInfo.h instead.

#import <CoreData/CoreData.h>


extern const struct UserInfoAttributes {
	__unsafe_unretained NSString *autoRegister;
	__unsafe_unretained NSString *password;
	__unsafe_unretained NSString *username;
} UserInfoAttributes;

extern const struct UserInfoRelationships {
} UserInfoRelationships;

extern const struct UserInfoFetchedProperties {
} UserInfoFetchedProperties;






@interface UserInfoID : NSManagedObjectID {}
@end

@interface _UserInfo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserInfoID*)objectID;





@property (nonatomic, strong) NSNumber* autoRegister;



@property BOOL autoRegisterValue;
- (BOOL)autoRegisterValue;
- (void)setAutoRegisterValue:(BOOL)value_;

//- (BOOL)validateAutoRegister:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* password;



//- (BOOL)validatePassword:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;






@end

@interface _UserInfo (CoreDataGeneratedAccessors)

@end

@interface _UserInfo (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAutoRegister;
- (void)setPrimitiveAutoRegister:(NSNumber*)value;

- (BOOL)primitiveAutoRegisterValue;
- (void)setPrimitiveAutoRegisterValue:(BOOL)value_;




- (NSString*)primitivePassword;
- (void)setPrimitivePassword:(NSString*)value;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;




@end
