//
//  BaseObject.m
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        for (NSString *key in [dict allKeys]) {
            if ([self respondsToSelector:NSSelectorFromString(key)]) {
                [self setValue:[dict valueForKey:key] forKey:key];
            }
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    return nil;
}

@end
