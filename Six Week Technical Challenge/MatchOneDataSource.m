//
//  PairRandomizerDataSource.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "MatchOneDataSource.h"
#import "EntityController.h"

static NSString *cellID = @"cellID";


@interface MatchOneDataSource () <UITableViewDataSource>

@end

@implementation MatchOneDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    Entity *temp = [[EntityController sharedInstance].matchOne objectAtIndex:indexPath.row];
    
    cell.textLabel.text = temp.string;
    

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
NSInteger count = [EntityController sharedInstance].matchOne.count;
    return count;
}



@end
