//
//  ViewController.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "PairRandomizerViewController.h"
#import "EntityController.h"

@interface PairRandomizerViewController ()


@property (weak, nonatomic) IBOutlet UITableView *matchTwoTableView;
@property (weak, nonatomic) IBOutlet UITableView *matchOneTableView;
@end

@implementation PairRandomizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.matchesTableView
//                                                                  attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.entityTableView
//                                                                  attribute:NSLayoutAttributeRight multiplier:1.0
//                                                                   constant:0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:self.matchesTableView
//                                                                  attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeTop multiplier:1.0
//                                                                   constant:64.0];
//    [self.view addConstraint:constraint];
//   constraint = [NSLayoutConstraint constraintWithItem:self.matchesTableView
//                                                                  attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeRight multiplier:1.0
//                                                                   constant:0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:self.matchesTableView
//                                                                  attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeBottom multiplier:1.0
//                                                                   constant:0 ];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:self.entityTableView
//                                                                  attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeTop multiplier:1.0
//                                                                   constant:64.0];
//    [self.view addConstraint:constraint];
//   constraint = [NSLayoutConstraint constraintWithItem:self.entityTableView
//                                                                  attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeBottom multiplier:1.0
//                                                                   constant:0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:self.entityTableView
//                                                                  attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
//                                                                  attribute:NSLayoutAttributeLeft multiplier:1.0
//                                                                   constant:0];
//    [self.view addConstraint:constraint];
   NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.matchOneTableView
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:0.5
                                               constant:0];
    [self.view addConstraint:constraint];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.matchOneTableView reloadData];
    [self.matchTwoTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)randomizedWasPressed:(id)sender {
    //Start with entities.
    NSMutableArray *bigPile = [EntityController sharedInstance].matchOne;
    
    for(int i = 0; i < [EntityController sharedInstance].matchTwo.count; i++)//Add Matches
    {
        [bigPile addObject:[EntityController sharedInstance].matchTwo[i]];
    }
    
    NSUInteger index = bigPile.count;
    //Set shared instances to empty now they are in big array.
    [EntityController sharedInstance].matchTwo = [NSMutableArray new];
    [EntityController sharedInstance].matchOne = [NSMutableArray new];
    
    //randomly shuffle big array.
   
    for (int i = 0; i < index - 1; i++) {
        NSInteger count = index - i;
        NSInteger exchangeIndex = i + arc4random_uniform((int)count);
        [bigPile exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    //Put big array back into the two arrays entities and matches.
    
    for(int i = 0; i < bigPile.count; i++) {
    if([EntityController sharedInstance].matchOne.count > [EntityController sharedInstance].matchTwo.count) {
        [[EntityController sharedInstance].matchTwo addObject:bigPile[i]];
    }
    else {
        [[EntityController sharedInstance].matchOne addObject:bigPile[i]];
    }
    }

    //Reload Tables
    [self viewWillAppear:YES];
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}

@end
