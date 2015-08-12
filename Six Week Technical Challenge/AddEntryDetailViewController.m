//
//  AddEntryDetailViewController.m
//  Six Week Technical Challenge
//
//  Created by Mattthew Bailey on 8/12/15.
//  Copyright (c) 2015 Mattthew Bailey. All rights reserved.
//

#import "AddEntryDetailViewController.h"
#import "EntityController.h"

@interface AddEntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *entityTextField;

@end

@implementation AddEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEntity:(id)sender {

    [[EntityController sharedInstance].allMatches addObject:[[Entity alloc] initWithString:self.entityTextField.text]];
    if([EntityController sharedInstance].matchOne.count > [EntityController sharedInstance].matchTwo.count) {
        [[EntityController sharedInstance].matchTwo addObject:[[EntityController sharedInstance].allMatches lastObject]];
    }
    else {
        [[EntityController sharedInstance].matchOne addObject:[[EntityController sharedInstance].allMatches lastObject]];
    }
    
    [[EntityController sharedInstance] save];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
