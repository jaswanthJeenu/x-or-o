//
//  ResultsViewController.h
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "BaseViewController.h"

@interface ResultsViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *lblResultsLabel;

- (IBAction)startWithSamePlayersClicked:(id)sender;
- (IBAction)startWithDifferentPlayersClicked:(id)sender;

@end
