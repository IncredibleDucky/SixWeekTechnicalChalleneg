//
//  EntityController.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "EntityController.h"

static NSString * const entitiesKey = @"Entities";

@implementation EntityController

+ (EntityController *)sharedInstance {
    static EntityController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntityController new];
        sharedInstance.matchTwo = [NSMutableArray new];
        sharedInstance.matchOne = [NSMutableArray new];
        sharedInstance.allMatches = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];
 //Instantiate Shared Instance Properties
    });
    return sharedInstance;
}

- (void)saveToPersistentStorage {
    NSMutableArray *entitiesDictionaries = [NSMutableArray new];
    
    for (Entity *entity in self.allMatches) {
        [entitiesDictionaries addObject:[entity dictionaryRepresentation]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entitiesDictionaries forKey:entitiesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)save {
    [self saveToPersistentStorage];
}

- (void)loadFromPersistentStorage {
    NSArray *entitiesDictionareis = [[NSUserDefaults standardUserDefaults] objectForKey:entitiesKey];
    
    for(int i = 0; i < entitiesDictionareis.count; i++) {
        [self.allMatches addObject:[[Entity alloc] initWithDictionary: entitiesDictionareis[i]]];
    }
    
    for (int i = 0; i < self.allMatches.count; i++) {
        if (i % 2 == 0) {
                    [self.matchOne addObject:self.allMatches[i]];
    } else {
        [self.matchTwo addObject:self.allMatches[i]];
    }
    }
}

@end
