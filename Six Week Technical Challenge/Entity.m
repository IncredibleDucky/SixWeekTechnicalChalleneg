//
//  Entity.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "Entity.h"

@implementation Entity

-(instancetype) initWithDictionary:(NSDictionary *)dictionary
{
    
    self = [super init];
    if(self) {
        self.string = dictionary[stringKey];
    }
    return self;
}

-(instancetype)initWithString:(NSString *)string {
    self = [super init];
    if(self) {
        self.string = string;
    }
    return self;
}

-(NSDictionary *)dictionaryRepresentation {
    return @{stringKey : self.string};
}

@end
