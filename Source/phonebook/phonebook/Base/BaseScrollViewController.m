//
//  BaseScrollViewController.m
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import "BaseScrollViewController.h"

@interface BaseScrollViewController ()

@end

@implementation BaseScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initializeVariables {
    [super initializeVariables];
}

- (void)initializeScreen {
    [super initializeScreen];
    
    self.originalScrollOffset = self.scrollView.contentOffset;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleScrollTouched:)];
    [self.scrollView addGestureRecognizer:tapGesture];
}

- (void)handleScrollTouched:(id)gesture {
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewToRect:(CGRect)toRect {
    float keyBoardHeight = 216.0;
    if (toRect.origin.y + toRect.size.height + 60 > self.view.frame.size.height - keyBoardHeight) {
        [self.scrollView setContentOffset:CGPointMake(0, toRect.origin.y + toRect.size.height - self.view.frame.size.height + keyBoardHeight + 60) animated:YES];
    }
}

- (void)revertScrollViewToOriginal {
    [self.scrollView setContentOffset:self.originalScrollOffset animated:YES];
}

- (void)exitScroll {
    [self.view endEditing:YES];
    [self revertScrollViewToOriginal];
}

@end
