// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WatchStore.h instead.

#import <CoreData/CoreData.h>


extern const struct WatchStoreAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *credits;
	__unsafe_unretained NSString *descriptionResourceURL;
	__unsafe_unretained NSString *descriptionText;
	__unsafe_unretained NSString *district;
	__unsafe_unretained NSString *fax;
	__unsafe_unretained NSString *foundTime;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *postcode;
	__unsafe_unretained NSString *province;
	__unsafe_unretained NSString *registerTime;
	__unsafe_unretained NSString *storeIdentifier;
	__unsafe_unretained NSString *summaryRate;
	__unsafe_unretained NSString *version;
	__unsafe_unretained NSString *website;
	__unsafe_unretained NSString *weibo;
} WatchStoreAttributes;

extern const struct WatchStoreRelationships {
	__unsafe_unretained NSString *watches;
} WatchStoreRelationships;

extern const struct WatchStoreFetchedProperties {
} WatchStoreFetchedProperties;

@class Watch;






















@interface WatchStoreID : NSManagedObjectID {}
@end

@interface _WatchStore : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WatchStoreID*)objectID;





@property (nonatomic, strong) NSString* address;



//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* city;



//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* credits;



@property float creditsValue;
- (float)creditsValue;
- (void)setCreditsValue:(float)value_;

//- (BOOL)validateCredits:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* descriptionResourceURL;



//- (BOOL)validateDescriptionResourceURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* descriptionText;



//- (BOOL)validateDescriptionText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* district;



//- (BOOL)validateDistrict:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* fax;



//- (BOOL)validateFax:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* foundTime;



//- (BOOL)validateFoundTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* latitude;



//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* longitude;



//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* phone;



//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postcode;



//- (BOOL)validatePostcode:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* province;



//- (BOOL)validateProvince:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* registerTime;



//- (BOOL)validateRegisterTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* storeIdentifier;



@property int32_t storeIdentifierValue;
- (int32_t)storeIdentifierValue;
- (void)setStoreIdentifierValue:(int32_t)value_;

//- (BOOL)validateStoreIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* summaryRate;



@property float summaryRateValue;
- (float)summaryRateValue;
- (void)setSummaryRateValue:(float)value_;

//- (BOOL)validateSummaryRate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* version;



@property int16_t versionValue;
- (int16_t)versionValue;
- (void)setVersionValue:(int16_t)value_;

//- (BOOL)validateVersion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* website;



//- (BOOL)validateWebsite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* weibo;



//- (BOOL)validateWeibo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *watches;

- (NSMutableSet*)watchesSet;





@end

@interface _WatchStore (CoreDataGeneratedAccessors)

- (void)addWatches:(NSSet*)value_;
- (void)removeWatches:(NSSet*)value_;
- (void)addWatchesObject:(Watch*)value_;
- (void)removeWatchesObject:(Watch*)value_;

@end

@interface _WatchStore (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSString*)primitiveCity;
- (void)setPrimitiveCity:(NSString*)value;




- (NSNumber*)primitiveCredits;
- (void)setPrimitiveCredits:(NSNumber*)value;

- (float)primitiveCreditsValue;
- (void)setPrimitiveCreditsValue:(float)value_;




- (NSString*)primitiveDescriptionResourceURL;
- (void)setPrimitiveDescriptionResourceURL:(NSString*)value;




- (NSString*)primitiveDescriptionText;
- (void)setPrimitiveDescriptionText:(NSString*)value;




- (NSString*)primitiveDistrict;
- (void)setPrimitiveDistrict:(NSString*)value;




- (NSString*)primitiveFax;
- (void)setPrimitiveFax:(NSString*)value;




- (NSDate*)primitiveFoundTime;
- (void)setPrimitiveFoundTime:(NSDate*)value;




- (NSString*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSString*)value;




- (NSString*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;




- (NSString*)primitivePostcode;
- (void)setPrimitivePostcode:(NSString*)value;




- (NSString*)primitiveProvince;
- (void)setPrimitiveProvince:(NSString*)value;




- (NSDate*)primitiveRegisterTime;
- (void)setPrimitiveRegisterTime:(NSDate*)value;




- (NSNumber*)primitiveStoreIdentifier;
- (void)setPrimitiveStoreIdentifier:(NSNumber*)value;

- (int32_t)primitiveStoreIdentifierValue;
- (void)setPrimitiveStoreIdentifierValue:(int32_t)value_;




- (NSNumber*)primitiveSummaryRate;
- (void)setPrimitiveSummaryRate:(NSNumber*)value;

- (float)primitiveSummaryRateValue;
- (void)setPrimitiveSummaryRateValue:(float)value_;




- (NSNumber*)primitiveVersion;
- (void)setPrimitiveVersion:(NSNumber*)value;

- (int16_t)primitiveVersionValue;
- (void)setPrimitiveVersionValue:(int16_t)value_;




- (NSString*)primitiveWebsite;
- (void)setPrimitiveWebsite:(NSString*)value;




- (NSString*)primitiveWeibo;
- (void)setPrimitiveWeibo:(NSString*)value;





- (NSMutableSet*)primitiveWatches;
- (void)setPrimitiveWatches:(NSMutableSet*)value;


@end
