//
//  BiologyListViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/4/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "BiologyListViewController.h"

@interface BiologyListViewController ()
{
    NSArray *_categories;
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
        self.navigationItem.title = @"Subjects";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(searchPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _categories = @[@"Anatomy", @"Biochemistry", @"Cell Biology", @"Ecology", @"Genetics", @"Mycology", @"Zoology"];
    }
    return self;
}

- (IBAction)searchPressed:(id)sender
{
    
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
}

@end
