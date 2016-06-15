//
//  LoginViewController.h
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtPlayer1Name;
@property (weak, nonatomic) IBOutlet UITextField *txtPlayer2Name;

- (IBAction)startPlayingClicked:(id)sender;

@end
