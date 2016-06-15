//
//  GameViewController.h
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "BaseViewController.h"

@interface GameViewController : BaseViewController
    

@property (weak, nonatomic) IBOutlet UISlider *player1TimeSlider;
@property (weak, nonatomic) IBOutlet UISlider *player2TimeSlider;

@property (weak, nonatomic) IBOutlet UILabel *lblPlayer1Name;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayer2Name;


@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnPause;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;

- (IBAction)resetClicked:(id)sender;
- (IBAction)gameButtonClicked:(id)sender;


//- (IBAction)slider1ValueChanged:(id)sender;
//- (IBAction)slider2ValueChanged:(id)sender;

- (IBAction)pauseBtnClicked:(id)sender;
- (IBAction)backClicked:(id)sender;




@end
