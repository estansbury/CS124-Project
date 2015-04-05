//
//  WordListViewController.h
//  Ceph
//
//  Created by Rachel Wilson on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WordListViewControllerDelegate <NSObject>

- (void)didSelectWord:(NSObject *)word;

@end

@interface WordListViewController : UITableViewController

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setWordMode:(BOOL)addWordMode;

@property id <WordListViewControllerDelegate>delegate;

@end
