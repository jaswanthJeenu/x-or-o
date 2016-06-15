//
//  AppDelegate.h
//  TicTacToe
//
//  Created by Jaswanth Jeenu on 21/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, strong) NSString *player1Name;
@property(nonatomic, strong) NSString *player2Name;
@property BOOL isPlayer1Turn;
@property BOOL isDraw;
@property BOOL isPaused;

@end

