//
//  BiologyListViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/4/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "BiologyListViewController.h"
#import "WordListViewController.h"
#import "CephalopodViewController.h"

@interface BiologyListViewController ()
<WordListViewControllerDelegate>
{
    NSArray *_categories;
    BOOL _addWordMode;
}

@end

@implementation BiologyListViewController

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
        self.navigationItem.title = @"Biology";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(searchPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _categories = @[@"Anatomy", @"Biochemistry", @"Cell Biology", @"Ecology", @"Genetics", @"Mycology", @"Zoology"];
        
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
    static NSString *identifier = @"bioCellReuseID";
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
    //TODO: bring up Cephalopod info page
    WordListViewController *wordVC = [[WordListViewController alloc] initWithFrame:self.view.frame];
    [wordVC setWordMode:_addWordMode];
    [wordVC setDelegate:self];
    [self.navigationController pushViewController:wordVC animated:YES];
}

- (void)setWordMode:(BOOL)addWordMode
{
    _addWordMode = addWordMode;
}

- (void)didSelectWord:(NSObject *)word
{
    [self.navigationController popViewControllerAnimated:NO];
    [_delegate didSelectWord:word];
}

@end
