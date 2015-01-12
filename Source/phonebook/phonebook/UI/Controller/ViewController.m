//
//  ViewController.m
//  DemoSelfContactWithTableViewCustom
//
//  Created by Cuong on 9/29/14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContant:)];
    [self getAllContact];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.arrContact.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    ObItemContact *item = [self.arrContact objectAtIndex:indexPath.row];
    cell.lbFirstName.text = item.firstName;
    cell.lbLastName.text = item.lastName;
    cell.lbNumberPhone.text = item.numberPhone;
    if(item.avatar == nil)
    {
        cell.myImageView.image = [UIImage imageNamed:@"images (1).jpeg"];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.myImageView.image = item.avatar;
        });
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    EditContactViewController *editCV = [myStoryBoard instantiateViewControllerWithIdentifier:@"editContactID"];
    
    [self.navigationController pushViewController:editCV animated:YES];
}

-(void)getAllContact{
    CFErrorRef *error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        if(granted)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self getDataInAddressBook:addressBook];
            });
        }
    });
}

-(void)getDataInAddressBook:(ABAddressBookRef)myAddressBook {
    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(myAddressBook);
    CFIndex count = ABAddressBookGetPersonCount(myAddressBook);
    NSMutableArray *arrAdress = [[NSMutableArray alloc] init];
    for(int i  = 0; i < count; i++)
    {
        ABRecordRef record = CFArrayGetValueAtIndex(allPeople, i);
        ObItemContact *ob = [[ObItemContact alloc] init];
        ob.firstName = (__bridge NSString *) ABRecordCopyValue(record, kABPersonFirstNameProperty);
        ob.lastName = (__bridge NSString *)ABRecordCopyValue(record, kABPersonLastNameProperty);
        ABMultiValueRef allPhoneNumberForPerSon = ABRecordCopyValue(record, kABPersonPhoneProperty);
        NSData *imgData = (__bridge NSData *)ABPersonCopyImageData(record);
        ob.avatar = [[UIImage imageWithData:imgData] resizeToSize:CGSizeMake(100, 100)];
        ob.numberPhone = [[NSMutableString alloc]init];
        for (int j = 0; j < ABMultiValueGetCount(allPhoneNumberForPerSon); j++) {
            CFStringRef numberPhongEachPerson = ABMultiValueCopyValueAtIndex(allPhoneNumberForPerSon, j);
            //CFStringRef locLabel = ABMultiValueCopyLabelAtIndex(allPhoneNumberForPerSon, j);
            //NSString *phoneLabel =(__bridge NSString* )ABAddressBookCopyLocalizedLabel(locLabel);
            NSString *nb = [NSString stringWithFormat:@"%@, ", (__bridge NSString *)numberPhongEachPerson];
            [ob.numberPhone appendString:nb];
        }
        [arrAdress addObject:ob];
        
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self refeshDataTable:arrAdress];
    });
}

-(void)refeshDataTable:(NSMutableArray *)arrAddress{
    self.arrContact = arrAddress;
    [self.myTableView reloadData];
}

-(IBAction)addContant:(id)sender {
    
    
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    AddContantViewController *addController = [myStoryBoard instantiateViewControllerWithIdentifier:@"addContactID"];
    
    addController.contactDelegate = self;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addController];
    
    [self presentViewController:navController animated:YES completion:nil];
//    [self presentViewController:addController animated:YES completion:nil];
}
-(void)addNewContact:(NSString *)firstName lastname:(NSString *)lastName{
    ObItemContact *ob = [[ObItemContact alloc] init];
    ob.firstName = firstName;
    ob.lastName = lastName;
    [self.arrContact addObject:ob];
    [self.myTableView reloadData];
}

@end
