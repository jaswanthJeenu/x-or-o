//
//  ResultsViewController.m
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@property(nonatomic, strong) NSString *temp;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    if ((delegate.isPlayer1Turn == NO) && (delegate.isDraw == NO)){
        NSString *temp = [NSString stringWithFormat:@"%@ Won!", delegate.player1Name];
        self.lblResultsLabel.text = [NSString stringWithString:temp];
    }
    if ((delegate.isPlayer1Turn == YES) && (delegate.isDraw == NO)){
        NSString *temp = [NSString stringWithFormat:@"%@ Won!", delegate.player2Name];
        self.lblResultsLabel.text = [NSString stringWithString:temp];
    }
    else if (delegate.isDraw == YES){
        NSString *temp = [NSString stringWithFormat:@"It is a Draw :o"];
        self.lblResultsLabel.text = [NSString stringWithString:temp];

    }
}

- (IBAction)startWithSamePlayersClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)startWithDifferentPlayersClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
