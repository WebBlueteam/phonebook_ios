//
//  ViewController.h
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObItemContact.h"
#import "MyTableViewCell.h"
#import "AddContantViewController.h"
#import "EditContactViewController.h"
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ABPeoplePickerNavigationControllerDelegate, ContactViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *arrContact;
@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@end

