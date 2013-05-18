//
//  NSManagedObjectContext+Utilities.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Utilities)

- (NSArray* ) objectsForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue;
- (NSManagedObject* ) objectForEntityName:(NSString* )anEntity matchingKey:(NSString* )aKey andValue:(id)aValue;
- (NSArray* ) allObjectsForEntityName:(NSString* )anEntity;


/*!
 Deletes every object in the database.
 This is to be used sparingly, however, it has it's usefulness when refreshing from a new dtafile: comparing rows to update changed values is very time-consuming (lots of fetches), and the alternative would be to delete the datastore file completely, which would certainly have really nasty side-effects if the file is open.
 It's up to observers who are using the datastore, to manage changes appropriately if needed.  (for example, a report is already open when the data is refreshed)
 \warning Don't use this unless you know for sure that this is what you want to do.
 */
- (void) deleteAllObjects;

@end
