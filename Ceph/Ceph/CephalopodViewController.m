//
//  CephalopodViewController.m
//  Ceph
//
//  Created by Rachel Wilson on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "CephalopodViewController.h"
@interface CephalopodViewController ()
{
    UITextView *_textView;
};

@end

@implementation CephalopodViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super init])
    {
        _textView = [[UITextView alloc] initWithFrame:frame];
        [self addTextView];
        //((UITextView *)self.view).dataSource = self;
        self.navigationItem.title = @"Cephalopod";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"search"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(addWordPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        
    }
    return self;
}

- (void)addTextView
{
    //_textView.delegate = self;
    NSString *textString = [NSString stringWithFormat: @"*Roots:*  [ceph]: head  [pod]: foot \n \n Definition: an active predatory mollusk of the large class Cephalopoda, such as an octopus or squid.\n \n Words with similar roots: \n cephalization\n \n octopod\n \n podium \n \n tripod"];
    [_textView setText:textString];
    [self.view addSubview:_textView];
}

- (IBAction)addWordPressed:(id)sender
{
    //stub
}



@end