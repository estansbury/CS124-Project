//
//  VocabListViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "VocabListViewController.h"
#import "VocabViewController.h"
#import "DataModel.h"

@interface VocabListViewController ()
{
    NSDictionary *_vocabLists;
    VocabViewController *_vocabVC;
    DataModel *_dataModel;
}

@end

@implementation VocabListViewController

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
        
        self.navigationItem.title = @"Vocab";
        
        UIBarButtonItem *newListButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"New"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(newListPressed:)];
        self.navigationItem.rightBarButtonItem = newListButton;
        
        _dataModel = [[DataModel alloc] init];
        
        _vocabLists = [_dataModel getVocabLists];
    }
    return self;
}

- (void)viewDidLoad {
    //stub
}

- (void)didReceiveMemoryWarning {
    //do nothing for now
}

- (IBAction)newListPressed:(id)sender
{
    UIAlertView *listTitleAlert = [[UIAlertView alloc] initWithTitle:@"New Vocabulary List Name:"
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"New List", nil];
    listTitleAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [listTitleAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    if (buttonIndex == 1) {
        NSString *newList = [[alertView textFieldAtIndex:0] text];
        [_dataModel addNewVocabList:newList];
        _vocabLists = [_dataModel getVocabLists];
        
        [(UITableView*)self.view reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_vocabLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"VocabListCellReuseID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_vocabLists.allKeys objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_vocabVC == nil) {
        _vocabVC = [[VocabViewController alloc] initWithFrame:self.view.frame];
    }
    NSString *selectedList = [NSString stringWithFormat:@"%@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [_vocabVC setTitle:selectedList andWords:[_vocabLists objectForKey:selectedList]];
    [self.navigationController pushViewController:_vocabVC animated:YES];
}

@end
