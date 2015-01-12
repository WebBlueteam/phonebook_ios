//
//  AddContantViewController.h
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@protocol ContactViewControllerDelegate <NSObject>
@required
-(void)addNewContact:(NSString *)firstName lastname:(NSString *)lastName;

@end

@interface AddContantViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>
@property (nonatomic, strong) IBOutlet UITextField *tfFirstName;
@property (nonatomic, strong) IBOutlet UITextField * tfLastName;
@property (nonatomic, assign) id<ContactViewControllerDelegate> contactDelegate;
-(IBAction)actionCancel:(id)sender;
-(IBAction)actionDone:(id)sender;
@end
