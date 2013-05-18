//
//  NSManagedObjectContext+Utilities.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "NSManagedObjectContext+Utilities.h"

@implementation NSManagedObjectContext (Utilities)

- (NSArray* ) objectsForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue {
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"%K == %@", aKey, aValue];
    NSFetchRequest* fr = [[NSFetchRequest alloc] init];
    [fr setEntity:[NSEntityDescription entityForName:anEntity inManagedObjectContext:self]];
    [fr setPredicate: pred];
    
    __block NSArray* results;
    __block NSError* anyError = nil;
    
    if (self.concurrencyType == NSPrivateQueueConcurrencyType) {
        [self performBlockAndWait:^{
            results = [self executeFetchRequest:fr error:&anyError];
        }];
    } else {
        results = [self executeFetchRequest:fr error:&anyError];
    }
    if (nil != anyError) {
        NSLog(@"Error fetching objects: %@.  Returning an empty array.", [anyError localizedDescription]);
        results = @[];
    }
    
    
    return results;
}

-(NSManagedObject *)objectForEntityName:(NSString *)anEntity matchingKey:(NSString *)aKey andValue:(id)aValue {
    NSArray* results = [self objectsForEntityName:anEntity matchingKey:aKey andValue:aValue];
    if ([results count] > 1) {
        // raise the moreThanOneException
        [NSException raise:@"MoreThanOneObjectExceptionIdentifier" format:@"More than one object returned for fetch <%@: %@ = %@>", anEntity, aKey, aValue, nil];
    }
    
    NSManagedObject* returnValue = ([results count] == 1) ? (NSManagedObject* )results[0] : nil;
    
    return returnValue;
}

- (NSArray* ) allObjectsForEntityName:(NSString* ) anEntity {
    __block NSArray *fetchedObjects;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:anEntity
                                              inManagedObjectContext:self];
    [fetchRequest setEntity:entity];
    
    __block NSError *error = nil;
    if (self.concurrencyType ==NSPrivateQueueConcurrencyType ) {
        [self performBlockAndWait:^{
            fetchedObjects = [self executeFetchRequest:fetchRequest error:&error];
        }];
    } else {
        fetchedObjects = [self executeFetchRequest:fetchRequest error:&error];
    }
    if( fetchedObjects == nil || (error) ) {
        fetchedObjects = @[];
    }
    
	return fetchedObjects;
}

- (void) deleteAllObjects {
    
    NSManagedObjectModel* theModel = self.persistentStoreCoordinator.managedObjectModel;
    for (NSString* anEntityName in [theModel.entitiesByName allKeys]) {
        NSArray* allOfThem = [self allObjectsForEntityName:anEntityName];
        for (NSManagedObject* anObject in allOfThem) {
            [self deleteObject:anObject];
        }
    }
}


@end
