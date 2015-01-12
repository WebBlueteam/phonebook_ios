//
//  BaseViewController.h
//  Zippie
//
//  Created by Manh Nguyen on 5/13/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>

@interface BaseViewController : UIViewController

/* This variable is used to check current orientation after rotate */
@property (nonatomic, assign) UIInterfaceOrientationMask currentOrientationMask;

/* This variable is used to create a background of view controller */
@property (nonatomic, strong) IBOutlet UIImageView *bgView;

/* This variable is used to show loading view on view controller */
//@property (nonatomic, strong) LoadingView *loadingView;

- (void)initializeVariables;

- (void)initializeScreen;

- (void)exitScreen;

- (void)styleLayout;

- (void)loadViewController;

- (void)reloadViewController;

- (void)stopAllTaskBeforeQuit;

- (BOOL)shouldShowHomeButton;

- (BOOL)shouldShowPointInfo;

- (void)setNavigationPointInfo;

- (BOOL)shouldHideNavigationBar;

- (BOOL)shouldHideToolBar;

- (BOOL)shouldHideFooterView;

- (BOOL)isLandscapeMode;

- (BOOL)validateScreen:(BOOL)isShowAlert;

- (NSMutableArray *)parseDictionaryToObjects:(id)dict;

- (void)handleHomeButton:(id)sender;

- (void)handlePointInfoButton:(id)sender;

@end
