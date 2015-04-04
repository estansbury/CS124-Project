//
//  SubjectListView.h
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubjectListViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithFrame:(CGRect)frame;

@end
