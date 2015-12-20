//
//  DataStoreManager.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "CoreDataStore.h"
#import "CoreDataStoreErrors.h"
#import "NSError+OWMErrors.h"

#import "ActualWeatherManaged.h"

@interface CoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataStore

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"openweather.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }
    
    return self;
}

#pragma mark - Public


- (id)newActualWeather {
    ActualWeatherManaged *actualWeather = [ActualWeatherManaged insertInManagedObjectContext:self.managedObjectContext];
    
    return actualWeather;
}


- (void)fecthActualWeatherWithCompletion:(ActualWeatherCompletionBlock)completionBlock
                                   error:(ActualWeatherErrorBlock)errorBlock {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[ActualWeatherManaged entityName]];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (results.count == 0) {
            if (errorBlock) {
                NSError *error = [NSError errorWithDescription:CoreDataStoreActualWeatherNotExistsDescription
                                                        reason:CoreDataStoreActualWeatherNotExistsReason
                                                        domain:CoreDataStoreErrorDomain
                                                          code:CoreDataStoreActualWeatherNotExists
                                                   parentError:nil];
                
                errorBlock(error);
            }
        }
        
        if (completionBlock)
        {
            completionBlock([results firstObject]);
        }
    }];
    
}

- (void)saveOnError:(ActualWeatherErrorBlock)errorBlock {
    
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        errorBlock(error);
    }
}

@end
