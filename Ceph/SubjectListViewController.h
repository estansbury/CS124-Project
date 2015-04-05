//
//  SubjectListView.h
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubjListViewControllerDelegate <NSObject>

- (void)didSelectWord:(NSObject *)word;

@end

@interface SubjectListViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setWordMode:(BOOL)addWordMode;

@property id <SubjListViewControllerDelegate>delegate;

@end
