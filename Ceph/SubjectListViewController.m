//
//  SubjectListView.m
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "SubjectListViewController.h"
#import "BiologyListViewController.h"
#import "CephalopodViewController.h"

@interface SubjectListViewController ()
<BiologyListViewControllerDelegate>
{
    NSArray *_subjects;
    BOOL _addWordMode;
}

@end

@implementation SubjectListViewController 

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init])
    {
        self.view = [[UITableView alloc] initWithFrame:frame];
        ((UITableView *)self.view).delegate = self;
        ((UITableView *)self.view).dataSource = self;
        self.navigationItem.title = @"Subjects";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(searchPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _subjects = @[@"Anthropology", @"Astronomy", @"Biology", @"Chemistry", @"Geology", @"Physics"];
        
        _addWordMode = NO;
    }
    return self;
}

- (void)viewDidLoad {
    //stub
}

- (void)didReceiveMemoryWarning {
    //do nothing for now
}

- (IBAction)searchPressed:(id)sender {
    
    UIAlertView *searchAlert;
    if (_addWordMode) {
        searchAlert = [[UIAlertView alloc] initWithTitle:@"Enter Word"
                                                 message:nil
                                                delegate:self
                                       cancelButtonTitle:@"cancel"
                                       otherButtonTitles:@"add", nil];
    } else {
        searchAlert = [[UIAlertView alloc] initWithTitle:@"Enter Word"
                                                 message:nil
                                                delegate:self
                                       cancelButtonTitle:@"cancel"
                                       otherButtonTitles:@"search", nil];
    }
    
    searchAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [searchAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    if (buttonIndex == 1) {
        if (!_addWordMode) {
            CephalopodViewController *cephVC = [[CephalopodViewController alloc] initWithFrame:self.view.frame];
            [self.navigationController pushViewController:cephVC animated:YES];
        } else {
            [self.delegate didSelectWord:[[alertView textFieldAtIndex:0] text]];
        }
        
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_subjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"subjectCellReuseID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_subjects objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BiologyListViewController *bioVC = [[BiologyListViewController alloc] initWithFrame:self.view.frame];
    [bioVC setWordMode:_addWordMode];
    [bioVC setDelegate:self];
    [self.navigationController pushViewController:bioVC animated:YES];
}

- (void)setWordMode:(BOOL)addWordMode
{
    _addWordMode = addWordMode;
}

- (void)didSelectWord:(NSObject *)word
{
    [self.navigationController popViewControllerAnimated:NO];
    [_delegate didSelectWord:nil];
}




@end
