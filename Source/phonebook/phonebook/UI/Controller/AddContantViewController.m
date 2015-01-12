//
//  AddContantViewController.m
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "AddContantViewController.h"

@interface AddContantViewController ()

@end

@implementation AddContantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancel:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(actionDone:)];
    self.navigationItem.title = @"Add Contact";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actionDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self AddContactToAddressBook];
}

-(IBAction)actionCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)AddContactToAddressBook {
    // cai nay co them lam cai edit luon
    CFErrorRef *error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
    ABRecordRef infoPerson = ABPersonCreate();
    ABRecordSetValue(infoPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef) self.tfFirstName.text , error);
    ABRecordSetValue(infoPerson, kABPersonLastNameProperty, (__bridge CFTypeRef) self.tfLastName.text , error);
    ABAddressBookAddRecord(addressBook, infoPerson, error);
    ABAddressBookSave(addressBook, error);
    CFRelease(infoPerson);
    CFRelease(addressBook);
    if(error != NULL)
    {
        NSLog(@"Qua trinh them bi sai");
    }
    else
    {
        [self.contactDelegate addNewContact:self.tfFirstName.text lastname:self.tfLastName.text];
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
