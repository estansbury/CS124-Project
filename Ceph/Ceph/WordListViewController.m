//
//  WordListViewController.m
//  Ceph
//
//  Created by Rachel Wilson on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "WordListViewController.h"
#import "CephalopodViewController.h"

@interface WordListViewController ()
{
    NSArray *_categories;
    BOOL _addWordMode;
}

@end

@implementation WordListViewController

- (instancetype)init
{
    //don't use this
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super init])
    {
        self.view = [[UITableView alloc] initWithFrame:frame];
        ((UITableView *)self.view).delegate = self;
        ((UITableView *)self.view).dataSource = self;
        self.navigationItem.title = @"Zoology";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(searchPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _categories = @[@"Abdomen", @"Amphibians", @"Bilateral Symmetry", @"Bipedal", @"Cephalopod", @"Coelenterates", @"Delphinidae"];
        _addWordMode = NO;
    }
    return self;
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
    return [_categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"wordCellReuseID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_categories objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_addWordMode) {
        [_delegate didSelectWord:nil];
        
    } else {
        CephalopodViewController *cephVC = [[CephalopodViewController alloc] initWithFrame:self.view.frame];
        [self.navigationController pushViewController:cephVC animated:YES];
    }
    
}

- (void)setWordMode:(BOOL)addWordMode
{
    _addWordMode = addWordMode;
}

@end
