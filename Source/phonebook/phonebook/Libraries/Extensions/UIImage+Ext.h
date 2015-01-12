//
//  UIImage+Taglist.h
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright (c) 2012 Lunex Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ext)

- (UIImage *)circleImageWithSize:(CGFloat)size;
- (UIImage *)imageAsCircle:(BOOL)clipToCircle
               withDiamter:(CGFloat)diameter
               borderColor:(UIColor *)borderColor
               borderWidth:(CGFloat)borderWidth
              shadowOffSet:(CGSize)shadowOffset;
- (UIImage *)fixOrientation;
- (UIImage *)resizeToSize:(CGSize)newSize thenCropWithRect:(CGRect)cropRect;
- (UIImage *)resizeToSize:(CGSize)newSize;
- (UIImage *)cropCenterToSize:(CGSize)size;
- (UIImage *)cropCenterToSize:(CGSize)size shouldScale:(BOOL)shouldScale;
- (BOOL)isEqualTo:(UIImage *)image;

@end
 