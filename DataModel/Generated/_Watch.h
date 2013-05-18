// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Watch.h instead.

#import <CoreData/CoreData.h>


extern const struct WatchAttributes {
	__unsafe_unretained NSString *brand;
	__unsafe_unretained NSString *commentsCount;
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *imageCount;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *simpleDescription;
	__unsafe_unretained NSString *watchIdentifier;
} WatchAttributes;

extern const struct WatchRelationships {
	__unsafe_unretained NSString *store;
} WatchRelationships;

extern const struct WatchFetchedProperties {
} WatchFetchedProperties;

@class WatchStore;










@interface WatchID : NSManagedObjectID {}
@end

@interface _Watch : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WatchID*)objectID;





@property (nonatomic, strong) NSString* brand;



//- (BOOL)validateBrand:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* commentsCount;



@property int32_t commentsCountValue;
- (int32_t)commentsCountValue;
- (void)setCommentsCountValue:(int32_t)value_;

//- (BOOL)validateCommentsCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* imageCount;



@property int32_t imageCountValue;
- (int32_t)imageCountValue;
- (void)setImageCountValue:(int32_t)value_;

//- (BOOL)validateImageCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* price;



@property int32_t priceValue;
- (int32_t)priceValue;
- (void)setPriceValue:(int32_t)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* simpleDescription;



//- (BOOL)validateSimpleDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* watchIdentifier;



//- (BOOL)validateWatchIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) WatchStore *store;

//- (BOOL)validateStore:(id*)value_ error:(NSError**)error_;





@end

@interface _Watch (CoreDataGeneratedAccessors)

@end

@interface _Watch (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBrand;
- (void)setPrimitiveBrand:(NSString*)value;




- (NSNumber*)primitiveCommentsCount;
- (void)setPrimitiveCommentsCount:(NSNumber*)value;

- (int32_t)primitiveCommentsCountValue;
- (void)setPrimitiveCommentsCountValue:(int32_t)value_;




- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSNumber*)primitiveImageCount;
- (void)setPrimitiveImageCount:(NSNumber*)value;

- (int32_t)primitiveImageCountValue;
- (void)setPrimitiveImageCountValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (int32_t)primitivePriceValue;
- (void)setPrimitivePriceValue:(int32_t)value_;




- (NSString*)primitiveSimpleDescription;
- (void)setPrimitiveSimpleDescription:(NSString*)value;




- (NSString*)primitiveWatchIdentifier;
- (void)setPrimitiveWatchIdentifier:(NSString*)value;





- (WatchStore*)primitiveStore;
- (void)setPrimitiveStore:(WatchStore*)value;


@end
