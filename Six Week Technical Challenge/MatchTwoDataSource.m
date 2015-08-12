//
//  MatchesDataSource.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "MatchTwoDataSource.h"
#import "EntityController.h"

static NSString *cellReuse = @"CELLID";

@interface MatchTwoDataSource () <UITableViewDataSource>

@end

@implementation MatchTwoDataSource


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuse forIndexPath:indexPath];
    
    Entity *temp = [[EntityController sharedInstance].matchTwo objectAtIndex:indexPath.row];
    
    cell.textLabel.text = temp.string;
    
    //If statements check to see if a foreveralone statement is in the table, if it is then delete it. in case a real object is added later.
    if (temp == [[EntityController sharedInstance].matchTwo lastObject]) {
        if([EntityController sharedInstance].matchOne.count + [EntityController sharedInstance].matchTwo.count > [EntityController sharedInstance].allMatches.count) {
            [[EntityController sharedInstance].matchTwo removeLastObject];
        }
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //If array one is bigger than array two, add a forever alone object.
    if ([EntityController sharedInstance].matchOne.count > [EntityController sharedInstance].matchTwo.count) {
        [[EntityController sharedInstance].matchTwo addObject:[[Entity alloc] initWithString:@"FOREVER ALONE"]];
    }
        return [EntityController sharedInstance].matchTwo.count;
    
}




@end
