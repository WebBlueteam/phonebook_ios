//
//  ContactObject.h
//  phonebook
//
//  Created by THANG on 1/12/15.
//  Copyright (c) 2015 blueteam. All rights reserved.
//

#import "BaseObject.h"

@interface ContactObject : BaseObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSMutableString *numberPhone;
@property (nonatomic, strong) NSData *imgData;
@property (nonatomic, strong) UIImage *avatar;
@end
