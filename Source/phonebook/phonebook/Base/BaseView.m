//
//  BaseView.m
//  Zippie
//
//  Created by Manh Nguyen on 5/13/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        if ([mainBundle pathForResource:NSStringFromClass([self class]) ofType:@"nib"] != nil) {
            self.contentView = [[mainBundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
            [self addSubview:self.contentView];
            
            self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
            
            [self addConstraint:[self constraintToItem:self.contentView attribute:NSLayoutAttributeTop]];
            [self addConstraint:[self constraintToItem:self.contentView attribute:NSLayoutAttributeLeft]];
            [self addConstraint:[self constraintToItem:self.contentView attribute:NSLayoutAttributeBottom]];
            [self addConstraint:[self constraintToItem:self.contentView attribute:NSLayoutAttributeRight]];
        }
    }
    return self;
}

- (void)reloadView {
    // TODO on childs
}

- (void)closeKeyboard {
    // TODO on childs
}

- (void)makeEmpty {
    // TODO on childs
}

- (void)loadView {
    // TODO on childs
}

- (void)hideView:(BOOL)isHide {
    // TODO on childs
}

- (NSLayoutConstraint *)constraintToItem:(id)item attribute:(NSLayoutAttribute)attribute {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

@end
