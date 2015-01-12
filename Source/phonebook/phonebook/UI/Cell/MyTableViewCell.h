//
//  MyTableViewCell.h
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *lbFirstName;
@property (nonatomic, strong) IBOutlet UILabel *lbLastName;
@property (nonatomic, strong) IBOutlet UILabel *lbNumberPhone;
@property (nonatomic, strong) IBOutlet UIImageView *myImageView;
@end
