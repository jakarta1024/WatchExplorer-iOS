//
//  DataModelFactory.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "DataModelFactory.h"
#import "AppDelegate.h"
#define PERSISTENT_STORE_NAME @"Caching.sql"
#define COREDATA_MODEL_NAME @"CachingDataModel"
#define kDataStoreCreated @"WatchExpDataStoreCreatedKey"

@interface DataModelFactory ()
@property (nonatomic, readwrite, strong) NSPersistentStoreCoordinator * persistentStoreCoordinator;
//MARK: methods
-(void)setupDemoContent;
-(void)cleanResourcesFolder;
@end

@implementation DataModelFactory
@synthesize managedObjectContext = _managedObjectContext,
            managedObjectModel = _managedObjectModel,
            persistentStoreCoordinator = _persistentStoreCoordinator;


+(id)sharedInstance
{
    static DataModelFactory *__shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (__shareInstance == nil) {
            __shareInstance = [[DataModelFactory alloc] init];
        }
    });
    return __shareInstance;
}
// MARK: - Core Data stack
/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        [_managedObjectContext setRetainsRegisteredObjects:YES];
        [_managedObjectContext setPropagatesDeletesAtEndOfEvent:YES];
        [_managedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    }
    return _managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    // Load any and all the models
    NSURL* modelURL = [[NSBundle mainBundle] URLForResource:COREDATA_MODEL_NAME withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSParameterAssert(nil != _managedObjectModel);
    
    return _managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // TODO: Use the lastRunAppVersion default to check for CoreData model versioning and perform migration as needed.
    // TODO: Set a policy regarding app version numbers and CoreData model updates
    NSURL *applicationSupportDirectory = [(AppDelegate *)[[UIApplication sharedApplication] delegate] applicationSupportDirectory];
    NSURL * storeURL = [applicationSupportDirectory URLByAppendingPathComponent:PERSISTENT_STORE_NAME];
    NSError *error = nil;
    
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    // Always at least try lightweight migration
    
    NSDictionary* migrationOptions = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
                                       NSInferMappingModelAutomaticallyOption: @YES};
    NSPersistentStore *persistentStore = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                                   configuration:nil
                                                                                             URL:storeURL
                                                                                         options:migrationOptions
                                                                                           error:&error];
    if (!persistentStore)
    {
        /*
         TODO: Replace this implementation with code to handle the error appropriately.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"%@ %@, %@",NSLocalizedString(@"Error loading persistent store", @"error statement for error loading persistent store"), error, [error userInfo]);
        // TODO: Post an alert on the main thread --- maybe?
        
        // Archive the store and create a new one:
        // Just insert a timestamp in the name
        NSDateFormatter* df = [NSDateFormatter new];
        [df setDateFormat:@"yyyyMMdd_HHmm"];
        NSString* storeURLString = [storeURL path];
        NSString* backupStorePath = [[[storeURLString stringByDeletingPathExtension] stringByAppendingString:[df stringFromDate:[NSDate date]]] stringByAppendingPathExtension:@"sqlite"];
        NSURL* backupStoreURL = [NSURL fileURLWithPath:backupStorePath];
        error = nil;
        [[NSFileManager defaultManager] moveItemAtURL:storeURL toURL:backupStoreURL error:&error];
        // create the new store
        error = nil;
        persistentStore = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error];
        NSAssert(persistentStore != nil, @"Persistent store cannot be nil!");
        
        // should inform the user!
        [self setupDemoContent];
        
    } else {
        // if this is a brand-new data store:
        if (![[NSUserDefaults standardUserDefaults] boolForKey:kDataStoreCreated]) {
            // set the persistent store created flag
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kDataStoreCreated];
            [[NSUserDefaults standardUserDefaults] synchronize]; // sync immediately, so that we don't create too much demo data when there are early terminations.
            
            // setup the new store to be encrypted:
            NSError* anotherError = nil;
            [[NSFileManager defaultManager] setAttributes:@{NSFileProtectionKey: NSFileProtectionComplete} ofItemAtPath:[storeURL path] error:&anotherError];
            if(anotherError) {
                DebugLog(@"%@",anotherError);
            }
            DebugLog(@"\n\nAttributes of data store: %@", [[NSFileManager defaultManager] attributesOfItemAtPath:[storeURL path] error:nil]);
        }
    }
    
    return _persistentStoreCoordinator;
}

- (BOOL)saveContext
{
    BOOL success = YES;
    // Make sure we save this context from the queue that created it:
    __block NSManagedObjectContext *ec = self.managedObjectContext;
    if (ec != nil && [ec hasChanges]) {
        NSError* error = nil;
        success = [ec save:&error];
        
        if (!success)
        {
            // Discard what's in the context: this is where we can go wrong, when multiple documents are writing their changes back to the main context, an error in one can throw out pending potentially good changes from the others
            [ec rollback];
            
            // schedule an alert to show after we exit:
            __block NSError* theError = error;
            double delayInSeconds = 0.1; // next event or thereabouts
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
                NSLog(@"%@ %@, %@\n\nReverting",NSLocalizedString(@"Unresolved error", @"Unresolved error log statement"), theError, [theError userInfo]);
                UIAlertView* anAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"SAVE_ERROR_TITLE", @"Title for alert boxes when there is an non-specific save error")
                                                                  message:NSLocalizedString(@"SAVE_ERROR_MESSAGE", @"Alert message for a non-specific save error")
                                                                 delegate:nil
                                                        cancelButtonTitle:NSLocalizedString(@"OK_BUTTON_TITLE", @"Ok button title")
                                                        otherButtonTitles:nil];
                [anAlert show];
            });
            // Clean up any file cruft from failed downloads.
            // NOTE: this presupposes that this saveContext method is the one being used: the class may be saving and handling errors elsewhere.
            [self cleanResourcesFolder];
        }
        
    }
    return success;
}


-(void)setupDemoContent
{
    DebugLog(@"------**------");
}

-(void)cleanResourcesFolder
{

}

@end
