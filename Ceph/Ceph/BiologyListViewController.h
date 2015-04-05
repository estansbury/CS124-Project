//
//  BiologyListViewController.h
//  Ceph
//
//  Created by Emily Stansbury on 4/4/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BiologyListViewControllerDelegate <NSObject>

- (void)didSelectWord:(NSObject *)word;

@end

@interface BiologyListViewController : UITableViewController

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setWordMode:(BOOL)addWordMode;

@property id <BiologyListViewControllerDelegate>delegate;

@end
