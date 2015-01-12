//
//  BaseScrollViewController.h
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseScrollViewController : BaseViewController

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, assign) CGPoint originalScrollOffset;

/*!
 * Scroll a view to a position by Rect
 * @author Manh Nguyen
 * @param rect of position
 * @return void
 */
- (void)scrollViewToRect:(CGRect)toRect;
- (void)revertScrollViewToOriginal;

/*!
 * Additional setup for dismiss unwanted effect when leave view controller
 * @author Duc Nguyen
 * @param none
 * @return void
 */
- (void)exitScroll;

@end
