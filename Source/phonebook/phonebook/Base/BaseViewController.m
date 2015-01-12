//
//  BaseViewController.m
//  Zippie
//
//  Created by Manh Nguyen on 5/13/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import "BaseViewController.h"
//#import "EventManager.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    [self initializeVariables];
    [self initializeScreen];
}

- (void)dealloc {
    DLog(@"====================================================== %@ has been dealloc", [self class]);
}

#pragma mark - Touch event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self shouldShowPointInfo]) [self setNavigationPointInfo];
    
    [self.navigationController setNavigationBarHidden:[self shouldHideNavigationBar]];
    [self.navigationController setToolbarHidden:[self shouldHideToolBar]];
    
    // Update current orientation
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        self.currentOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    } else {
        self.currentOrientationMask = UIInterfaceOrientationMaskPortrait;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self exitScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        self.currentOrientationMask = UIInterfaceOrientationMaskPortrait;
    } else {
        self.currentOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    if (UIInterfaceOrientationIsPortrait(fromInterfaceOrientation)) {
        self.currentOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    } else {
        self.currentOrientationMask = UIInterfaceOrientationMaskPortrait;
    }
}

/*!
 * Ask is landcape mode or portrait
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (BOOL)isLandscapeMode {
    return self.currentOrientationMask == UIInterfaceOrientationMaskLandscapeRight || self.currentOrientationMask == UIInterfaceOrientationMaskLandscapeLeft;
}

/*!
 * Ask should show home button or not
 * @author Duc Nguyen
 * @param none
 * @return void
 */
- (BOOL)shouldShowHomeButton {
    return NO;
}

/*!
 * Ask should show point info or not
 * @author Duc Nguyen
 * @param none
 * @return void
 */
- (BOOL)shouldShowPointInfo {
    return NO;
}

/*!
 * Ask should hide navigation bar or not
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (BOOL)shouldHideNavigationBar {
    return NO;
}

/*!
 * Ask should hide toolbar or not
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (BOOL)shouldHideToolBar {
    return YES;
}

/*!
 * Ask should hide footer view
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (BOOL)shouldHideFooterView {
    return YES;
}

- (void)initializeVariables {
    // TODO on childs
}

/*!
 * Initialize screen, ui, style for view controller
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)initializeScreen {
    // TODO on childs
//    self.loadingView = [[LoadingView alloc] initWithFrame:self.view.frame];
    [self styleLayout];
}

/*!
 * Destroy screen when it disappears
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)exitScreen {
    // TODO on childs
}

/*!
 * Style layout with ui, font, size
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)styleLayout {
    // TODO on childs
}

- (void)initFooterView {
    // TODO on childs
}

/*!
 * Help to load view controller
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)loadViewController {
    // TODO on childs
}

/*!
 * Help to reload view controller
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)reloadViewController
{
    // TOTO on childs
}

/*!
 * Help to stop all task, listener before quit of screen
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)stopAllTaskBeforeQuit {
    DLog(@"stopAllTaskBeforeQuit called at %@", NSStringFromClass([self class]));
//    [[EventManager getInstance] removeListener:self channel:kChannelContacts];
//    [[EventManager getInstance] removeListener:self channel:kChannelMessages];
//    [[EventManager getInstance] removeListener:self channel:kChannelMenuOptions];
//    [[EventManager getInstance] removeListener:self channel:kChannelProfile];
}

- (NSMutableArray *)parseDictionaryToObjects:(id)dict {
    return nil;
}

- (BOOL)validateScreen:(BOOL)isShowAlert {
    return YES;
}

@end
