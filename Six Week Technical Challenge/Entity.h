//
//  Entity.h
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const stringKey = @"stringKey";

@interface Entity : NSObject

@property (nonatomic) NSString *string;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
-(instancetype) initWithString:(NSString *) string;
-(NSDictionary *)dictionaryRepresentation;

@end
