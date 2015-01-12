//
//  ObItemContact.h
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ObItemContact : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSMutableString *numberPhone;
@property (nonatomic, strong) NSData *imgData;
@property (nonatomic, strong) UIImage *avatar;
@end
