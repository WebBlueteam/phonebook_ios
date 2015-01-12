//
//  BaseView.h
//  Zippie
//
//  Created by Manh Nguyen on 5/13/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface BaseView : UIView

@property (nonatomic, strong) UIView *contentView;

/*!
 * Load view
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)loadView;

/*!
 * Reload view
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)reloadView;

/*!
 * Execute after keyboard closed
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)closeKeyboard;

/*!
 * Make view empty
 * @author Manh Nguyen
 * @param none
 * @return void
 */
- (void)makeEmpty;

/*!
 * Hide a view
 * @author Manh Nguyen
 * @param hide/unhide
 * @return void
 */
- (void)hideView:(BOOL)isHide;

@end
