//
//  VocabViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "VocabViewController.h"
#import "SubjectListViewController.h"
#import "CephalopodViewController.h"
#import "DataModel.h"

@interface VocabViewController ()
<SubjListViewControllerDelegate>

{
    NSMutableArray *_words;
    NSString *_title;
    DataModel *_dataModel;
}

@end

@implementation VocabViewController

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
        //self.navigationItem.title = @"Sea Life"; // Hard
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"Add"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(newWordPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        //_words = [@[@"Mollusca", @"Cnidaria", @"Nudibranch"] mutableCopy];
        _words = [[NSMutableArray alloc] init];
        _dataModel = [[DataModel alloc] init];
    }
    return self;
}

- (void)setTitle:(NSString *)title andWords:(NSMutableArray*)words
{
    _title = title;
    self.navigationItem.title = _title;
    _words = words;
}

- (void)viewDidLoad {
    //stub
}

- (void)didReceiveMemoryWarning {
    //do nothing for now
}

- (IBAction)newWordPressed:(id)sender {
    
    SubjectListViewController *subVC = [[SubjectListViewController alloc] initWithFrame:self.view.frame];
    [subVC setWordMode:YES];
    [subVC setDelegate:self];
    [self.navigationController pushViewController:subVC animated:YES];
    
    //[_words addObject:@"Cephalopod"];
    [(UITableView*)self.view reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_words count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"VocabCellReuseID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_words objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CephalopodViewController *cephVC = [[CephalopodViewController alloc] initWithFrame:self.view.frame];
    [self.navigationController pushViewController:cephVC animated:YES];
}

- (void)didSelectWord:(NSObject *)word
{
    [self.navigationController popViewControllerAnimated:NO];
    //do more things
    //NSString *stringWord = [NSString stringWithFormat:@"%@", word];
    NSString *stringWord = (NSString*) word;
    [_dataModel addWord:(NSString*)stringWord toList:_title];
    
    //[_words addObject:stringWord];
    [(UITableView*)self.view reloadData];
}

@end
