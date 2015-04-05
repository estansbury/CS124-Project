//
//  VocabListViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "VocabListViewController.h"
#import "VocabViewController.h"

@interface VocabListViewController ()
{
    NSArray *_vocabLists;
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
        
        _vocabLists = @[@"Earth Science", @"Vertibrates", @"Sea Life", @"Cool Words"];
    }
    return self;
}

- (void)viewDidLoad {
    //stub
}

- (void)didReceiveMemoryWarning {
    //do nothing for now
}

- (IBAction)newListPressed:(id)sender {
    
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
    cell.textLabel.text = [_vocabLists objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VocabViewController *vocabVC = [[VocabViewController alloc] initWithFrame:self.view.frame];
    [self.navigationController pushViewController:vocabVC animated:YES];
}

@end
