//
//  VocabListViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "VocabListViewController.h"

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
        self.navigationItem.title = @"Vocab";
        
        UIBarButtonItem *newListButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"New"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(newListPressed:)];
        self.navigationItem.rightBarButtonItem = newListButton;
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

@end
