//
//  VocabViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "VocabViewController.h"

@interface VocabViewController ()

{
    NSArray *_words;
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
        self.navigationItem.title = @"Sea Life";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(searchPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _words = @[@"Mollusca", @"Cnidaria", @"Nudibranch"];
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

@end
