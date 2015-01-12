//
//  BaseObject.h
//  Zippie
//
//  Created by Manh Nguyen on 10/14/14.
//  Copyright (c) 2014 Lunex Telecom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// thang
@interface BaseObject : NSObject

/*!
 * Constructor of BaseObject with NSDictionary
 * @author Manh Nguyen
 * @param dictionary
 * @return instance of object
 */
- (id)initWithDictionary:(NSDictionary *)dict;

/*!
 * Convert from BaseObject to NSDictionary
 * @author Manh Nguyen
 * @param none
 * @return dictionary of object
 */
- (NSDictionary *)toDictionary;

@end
