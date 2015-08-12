//
//  EntityController.h
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface EntityController : NSObject

@property (strong, nonatomic, readwrite) NSMutableArray *allMatches;
@property (strong, nonatomic, readwrite) NSMutableArray *matchOne;
@property (strong, nonatomic, readwrite) NSMutableArray *matchTwo;

+(instancetype)sharedInstance;
- (void)save;

@end
