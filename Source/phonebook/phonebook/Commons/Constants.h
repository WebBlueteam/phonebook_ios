//
//  Constants.h
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright 2011 Lunex Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Constants

#ifdef DEBUG

#define DLog(...) NSLog(@"%s [Line %d] %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#define DLogFrame(...) NSLog(@"%s [Line %d] (%f, %f, %f, %f)", __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__.origin.x, __VA_ARGS__.origin.y, __VA_ARGS__.size.width, __VA_ARGS__.size.height)
#define DLogPoint(...) NSLog(@"%s [Line %d] (%f, %f)", __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__.x, __VA_ARGS__.y)
#define DLogSize(...) NSLog(@"%s [Line %d] (%f, %f)", __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__.width, __VA_ARGS__.height)
#define DLogUIKit(...) NSLog(@"%s [Line %d] %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])

#else

#define DLog(...)
#define DLogFrame(...)
#define DLogPoint(...)
#define DLogSize(...)
#define DLogUIKit(...)

#endif

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define UIColorFromHexa(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480.0)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 ([[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736.0)

#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 && [[UIDevice currentDevice] systemVersion] floatValue] < 8)
#define IS_IOS_8_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

#define kDefaultAvatar  [UIImage imageNamed:@"profile_avatar.png"]


@end
