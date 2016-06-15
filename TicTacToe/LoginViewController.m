//
//  LoginViewController.m
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property(nonatomic, strong) NSString *temp1;
@property(nonatomic, strong) NSString *temp2;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtPlayer1Name.delegate = self;
    self.txtPlayer2Name.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    NSString *temp1 = [NSString stringWithFormat:@""];
    self.txtPlayer1Name.text = [NSString stringWithString:temp1];
    NSString *temp2 = [NSString stringWithFormat:@""];
    self.txtPlayer2Name.text = [NSString stringWithString:temp2];
}

- (IBAction)startPlayingClicked:(id)sender {
    if([self.txtPlayer1Name.text isEqualToString:@""] || [self.txtPlayer2Name.text isEqualToString:@""]) {
        // show error alert
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter names of both the players." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    } else {
        delegate.player1Name = self.txtPlayer1Name.text;
        delegate.player2Name = self.txtPlayer2Name.text;
        
        NSLog(@"Player 1 name: %@ and Player 2 name: %@", delegate.player1Name, delegate.player2Name);
        [self performSegueWithIdentifier:@"startGameSegue" sender:self];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self.txtPlayer1Name resignFirstResponder];
    [self.txtPlayer2Name resignFirstResponder];
}

@end
