//
//  MatchesDataSource.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "MatchesDataSource.h"
#import "EntityController.h"

static NSString *cellReuse = @"CELLID";

@interface MatchesDataSource () <UITableViewDataSource>

@end

@implementation MatchesDataSource


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuse forIndexPath:indexPath];
    
   Entity *temp = [[EntityController sharedInstance].matchTwo objectAtIndex:indexPath.row];
    NSLog(@"%@", temp);
    cell.textLabel.text = temp.string;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntityController sharedInstance].matchTwo.count;
}




@end
