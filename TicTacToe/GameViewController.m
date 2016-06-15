//
//  GameViewController.m
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property BOOL isGameFinished;
@property NSTimer *gameTimer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblPlayer1Name.text = delegate.player1Name;
    self.lblPlayer2Name.text = delegate.player2Name;
    
    delegate.isPlayer1Turn = YES;
    
    //[self.player1TimeSlider addTarget:self action:@selector(slider1ValueChanged:) forControlEvents:UIControlEventValueChanged];
    //[self.player2TimeSlider addTarget:self action:@selector(slider2ValueChanged:) forControlEvents:UIControlEventValueChanged];
    
//    self.player1TimeSlider.continuous = NO;
//    self.player2TimeSlider.continuous = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [self resetClicked:nil];
}

-(void)viewDidDisappear:(BOOL)animated{
    [self stopTimer];
}

- (IBAction)resetClicked:(id)sender {
    
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    [self.button2 setTitle:@"" forState:UIControlStateNormal];
    [self.button3 setTitle:@"" forState:UIControlStateNormal];
    [self.button4 setTitle:@"" forState:UIControlStateNormal];
    [self.button5 setTitle:@"" forState:UIControlStateNormal];
    [self.button6 setTitle:@"" forState:UIControlStateNormal];
    [self.button7 setTitle:@"" forState:UIControlStateNormal];
    [self.button8 setTitle:@"" forState:UIControlStateNormal];
    [self.button9 setTitle:@"" forState:UIControlStateNormal];
    
    delegate.isPaused = NO;
    delegate.isPlayer1Turn = YES;
    
    [self stopTimer];
    
    self.player1TimeSlider.value = 10;
    self.player2TimeSlider.value = 10 ;
    
    [self pauseBtnClicked:nil];
    
}

- (IBAction)gameButtonClicked:(id)sender {
    UIButton *clickedButton = sender;
    
    if ([clickedButton.currentTitle isEqualToString:@""]){
        if (delegate.isPlayer1Turn){
            [clickedButton setTitle:@"X" forState:UIControlStateNormal];
        }
        else{
            [clickedButton setTitle:@"O" forState:UIControlStateNormal];
        }
        delegate.isPlayer1Turn = !delegate.isPlayer1Turn;
        [self checkIfGameFinished];
    }
}

-(void) startTimer{
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}

-(void) stopTimer{
        if ([self.gameTimer isValid]){
            [self.gameTimer invalidate];
            self.gameTimer = nil;
        }
}

-(void) updateUI{
    NSLog(@"Timer is being called");
    if (delegate.isPaused == 1){
        if (delegate.isPlayer1Turn){
            [self.player1TimeSlider setValue:(self.player1TimeSlider.value - 1) animated:YES];
            if (self.player1TimeSlider.value == 0){
                [self performSegueWithIdentifier:@"showResultsSegue" sender:self];
            }
        } else {
            [self.player2TimeSlider setValue:(self.player2TimeSlider.value - 1) animated:YES];
            if (self.player2TimeSlider.value == 0){
                [self performSegueWithIdentifier:@"showResultsSegue" sender:self];
            }
        }
    }
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"Slider 1 value: %f", self.player1TimeSlider.value);
//        
//    });
}

//- (IBAction)slider1ValueChanged:(id)sender {
//    static int i = 0;
//    NSLog(@"slider1ValueChanged called: %d", i++);
//      if (self.player1TimeSlider.value == 0){
//          [self performSegueWithIdentifier:@"showResultsSegue" sender:self];
//      }
//}
//
//- (IBAction)slider2ValueChanged:(id)sender {
//      if (self.player2TimeSlider.value == 0){
//          [self performSegueWithIdentifier:@"showResultsSegue" sender:self];
//      }
//}

- (IBAction)pauseBtnClicked:(id)sender {
    
    if (delegate.isPaused == 1){
        UIImage* image = [UIImage imageNamed:@"play.png"];
        
        CGRect frameimg = CGRectMake(0, 0, image.size.width, image.size.height);
        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
        [someButton setBackgroundImage:image forState:UIControlStateNormal];
        [someButton addTarget:self action:@selector(pauseBtnClicked:)
             forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
        
        [self.navigationItem setRightBarButtonItem:barBtn];
        
        [self stopTimer];
    
        delegate.isPaused = !delegate.isPaused;
    }
    else {
        UIImage* image = [UIImage imageNamed:@"pause.png"];
        
        CGRect frameimg = CGRectMake(0, 0, image.size.width, image.size.height);
        UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
        [someButton setBackgroundImage:image forState:UIControlStateNormal];
        [someButton addTarget:self action:@selector(pauseBtnClicked:)
             forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *barBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
        
        [self.navigationItem setRightBarButtonItem:barBtn];
        
        [self startTimer];
        
        delegate.isPaused = !delegate.isPaused;
    }
}

- (IBAction)backClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) checkIfGameFinished{
    
    self.isGameFinished = NO;
    
    if (([self.button1.currentTitle isEqualToString:self.button2.currentTitle])
        && ([self.button2.currentTitle isEqualToString:self.button3.currentTitle])){
        if ([self.button1.currentTitle isEqualToString:@"X"]){
            self.isGameFinished=YES;
        } else if ([self.button1.currentTitle isEqualToString:@"O"]){
            self.isGameFinished=YES;
        }
        
    }
    else if (([self.button4.currentTitle isEqualToString:self.button5.currentTitle])
             && ([self.button5.currentTitle isEqualToString:self.button6.currentTitle])){
        if ([self.button4.currentTitle isEqualToString:@"X"]){
            self.isGameFinished=YES;
        } else if ([self.button4.currentTitle isEqualToString:@"O"]){
            self.isGameFinished=YES;
        }
        
    }
    else if (([self.button7.currentTitle isEqualToString:self.button8.currentTitle])
             && ([self.button8.currentTitle isEqualToString:self.button9.currentTitle])){
        if ([self.button7.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button7.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if (([self.button1.currentTitle isEqualToString:self.button4.currentTitle])
             && ([self.button4.currentTitle isEqualToString:self.button7.currentTitle])){
        if ([self.button1.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button1.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if (([self.button2.currentTitle isEqualToString:self.button5.currentTitle])
             && ([self.button5.currentTitle isEqualToString:self.button8.currentTitle])){
        if ([self.button2.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button2.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if (([self.button3.currentTitle isEqualToString:self.button6.currentTitle])
             && ([self.button6.currentTitle isEqualToString:self.button9.currentTitle])){
        if ([self.button3.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button3.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if (([self.button1.currentTitle isEqualToString:self.button5.currentTitle])
             && ([self.button5.currentTitle isEqualToString:self.button9.currentTitle])){
        if ([self.button1.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button1.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if (([self.button3.currentTitle isEqualToString:self.button5.currentTitle])
             && ([self.button5.currentTitle isEqualToString:self.button7.currentTitle])){
        if ([self.button3.currentTitle isEqualToString:@"X"]){
            
            self.isGameFinished=YES;
            
        }
        else if ([self.button3.currentTitle isEqualToString:@"O"]){
            
            self.isGameFinished=YES;
            
        }
        
    }
    else if ((!([self.button1.currentTitle isEqualToString:@""]))
             && (!([self.button2.currentTitle isEqualToString:@""]))
             && (!([self.button3.currentTitle isEqualToString:@""]))
             && (!([self.button4.currentTitle isEqualToString:@""]))
             && (!([self.button5.currentTitle isEqualToString:@""]))
             && (!([self.button6.currentTitle isEqualToString:@""]))
             && (!([self.button7.currentTitle isEqualToString:@""]))
             && (!([self.button8.currentTitle isEqualToString:@""]))
             && (!([self.button9.currentTitle isEqualToString:@""]))){
   
        self.isGameFinished=YES;
        delegate.isDraw=YES;
    }
    
    
    // write logic to check if game is finished
    if(self.isGameFinished) {
        [self performSegueWithIdentifier:@"showResultsSegue" sender:self];
    }
}
@end
