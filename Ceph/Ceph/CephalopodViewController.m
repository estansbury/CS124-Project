//
//  CephalopodViewController.m
//  Ceph
//
//  Created by Rachel Wilson on 4/5/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "CephalopodViewController.h"
#import "DataModel.h"
@interface CephalopodViewController ()
{
    UITextView *_textView;
    DataModel *_dataModel;
};

@end

@implementation CephalopodViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super init])
    {
       
        //[self addTextView];
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        [self addRoots];
        [self addDefinition];
        [self addRelatedWords];
        //((UITextView *)self.view).dataSource = self;
        self.navigationItem.title = @"Cephalopod";
        
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"Add"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(addWordPressed:)];
        self.navigationItem.rightBarButtonItem = searchButton;
        
        _dataModel = [[DataModel alloc] init];
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

- (void)addRoots
{
    UILabel *rootHeaderLabel = [[UILabel alloc] init];
    [rootHeaderLabel setText:@"Roots:"];
    [rootHeaderLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [rootHeaderLabel setFrame:CGRectMake(15, 75, self.view.frame.size.width, 30)];
    [self.view addSubview:rootHeaderLabel];
    
    NSString *rootText = [NSString stringWithFormat:@"ceph: head,  pod: foot"];
    UILabel *rootLabel = [[UILabel alloc] init];
    [rootLabel setText:rootText];
    [rootLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18]];
    [rootLabel setFrame:CGRectMake(35,
                                  105,
                                  self.view.frame.size.width,
                                   20)];
    [self.view addSubview:rootLabel];
}

- (void)addDefinition
{
    UILabel *headerLabel = [[UILabel alloc] init];
    [headerLabel setText:@"Definition:"];
    [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [headerLabel setFrame:CGRectMake(15, 135, self.view.frame.size.width, 30)];
    [self.view addSubview:headerLabel];
    
     _textView = [[UITextView alloc] initWithFrame:CGRectMake(35, 165,
                                                              self.view.frame.size.width -35,
                                                              150)];
    [_textView setText:@"An active predatory mollusk of the large class Cephalopoda, such as an octopus or squid. These exclusively marine animals are characterized by bilateral body symmetry, a prominent head, and a set of arms or tentacles (muscular hydrostats) modified from the primitive molluscan foot."];
    // definition partially from Wikipedia
    
    [_textView setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
    [self.view addSubview:_textView];
    
}

- (void)addRelatedWords
{
    UILabel *headerLabel = [[UILabel alloc] init];
    [headerLabel setText:@"Related Words:"];
    [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    [headerLabel setFrame:CGRectMake(15, 320, self.view.frame.size.width, 30)];
    [self.view addSubview:headerLabel];
    
    UILabel *wordLabel = [[UILabel alloc] init];
    [wordLabel setText:@"Cephalization"];
    [wordLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
    wordLabel.textColor = self.view.tintColor;
    [wordLabel setFrame:CGRectMake(35, 350, self.view.frame.size.width, 25)];
    [self.view addSubview:wordLabel];
    
    UILabel *wordTwoLabel = [[UILabel alloc] init];
    [wordTwoLabel setText:@"Octopod"];
    [wordTwoLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
    wordTwoLabel.textColor = self.view.tintColor;
    [wordTwoLabel setFrame:CGRectMake(35, 375, self.view.frame.size.width, 25)];
    [self.view addSubview:wordTwoLabel];
    
    UILabel *wordThreeLabel = [[UILabel alloc] init];
    [wordThreeLabel setText:@"Gastropod"];
    [wordThreeLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
    wordThreeLabel.textColor = self.view.tintColor;
    [wordThreeLabel setFrame:CGRectMake(35, 400, self.view.frame.size.width, 25)];
    [self.view addSubview:wordThreeLabel];
    
    UILabel *wordFourLabel = [[UILabel alloc] init];
    [wordFourLabel setText:@"Anacephaly"];
    [wordFourLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
    wordFourLabel.textColor = self.view.tintColor;
    [wordFourLabel setFrame:CGRectMake(35, 425, self.view.frame.size.width, 25)];
    [self.view addSubview:wordFourLabel];
    
    
}

- (IBAction)addWordPressed:(id)sender
{
    [_dataModel addWord:@"Cephalopod" toList:@"Cool Words"];
}



@end
