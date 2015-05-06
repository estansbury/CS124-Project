//
//  CephalopodViewController.h
//  Ceph
//
//  Created by Rachel Wilson on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CephalopodViewController : UIViewController <UIActionSheetDelegate>

- (instancetype)initWithFrame:(CGRect)frame;
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end