//
//  MainViewController.m
//  Ceph
//
//  Created by Emily Stansbury on 4/3/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "MainViewController.h"
#import "SubjectListViewController.h"
#import "VocabListViewController.h"
#import "CephalopodViewController.h"

@interface MainViewController () <UITextFieldDelegate>
{
    VocabListViewController *_vocabListVC;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150,
//                                                                self.view.frame.size.height/5,
//                                                                300,
//                                                                100)];
//    titleView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:titleView];
    
   
    [self addSearchBar];
    [self addSubjectButton];
    [self addListButton];
    self.navigationItem.title = @"Ceph Science Vocabulary App";
}

- (void)addSearchBar {
    //code from http://www.tutorialspoint.com/ios/ios_ui_elements_text_field.htm
    
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //This sets the label text
    prefixLabel.text =@" ";
    // This sets the font for the label
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    // This fits the frame to size of the text
    [prefixLabel sizeToFit];
    
    // This allocates the textfield and sets its frame
    UITextField *searchBar = [[UITextField alloc]
                              initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100,
                                                                           self.view.frame.size.height/3,
                                                                           200,
                                                                           50)];
    
    // This sets the border style of the text field
    searchBar.borderStyle = UITextBorderStyleRoundedRect;
    searchBar.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    [searchBar setFont:[UIFont boldSystemFontOfSize:14]];
    
    //Placeholder text is displayed when no text is typed
    searchBar.placeholder = @"search";
    
    //Prefix label is set as left view and the text starts after that
    searchBar.leftView = prefixLabel;
    
    //It set when the left prefixLabel to be displayed
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    [searchBar addTarget:self
                   action:@selector(searchBarShouldReturn:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
    
    // Adds the textField to the view.
    [self.view addSubview:searchBar];
    
    // sets the delegate to the current class
    searchBar.delegate = self;
}

- (void)addSubjectButton {
    UIButton *subjectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *subjectImage1 = [UIImage imageNamed:@"BrowseSubjectsButton.jpg"];
    [subjectButton setBackgroundImage:subjectImage1 forState:UIControlStateNormal];
    

    [subjectButton setFrame:CGRectMake(self.view.frame.size.width/2 - 100,
                                       self.view.frame.size.height/3 + 85,
                                       200,
                                       100)];

     [subjectButton addTarget:self
                      action:@selector(subjectButtonTapped:)
            forControlEvents:UIControlEventTouchUpInside];
    /*
    [subjectButton setTitle:@"Browse Subjects"
                   forState:UIControlStateNormal];
    
    subjectButton.titleLabel.font = [UIFont systemFontOfSize:20];
    subjectButton.layer.backgroundColor = [[UIColor colorWithRed:0.14
                                                           green:0.66
                                                            blue:0.20
                                                           alpha:0.7] CGColor];
    */
    [self.view addSubview:subjectButton];
}

- (void)addListButton {
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *subjectImage1 = [UIImage imageNamed:@"VocabListsButton.jpg"];
    [listButton setBackgroundImage:subjectImage1 forState:UIControlStateNormal];
    
    [listButton setFrame:CGRectMake(self.view.frame.size.width/2 - 100,
                                       self.view.frame.size.height/3 + 200,
                                       200,
                                       100)];
    [listButton addTarget:self
                      action:@selector(listButtonTapped:)
            forControlEvents:UIControlEventTouchUpInside];
    
    /*
    [listButton setTitle:@"My Vocab Lists"
                   forState:UIControlStateNormal];
    listButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    listButton.layer.backgroundColor = [[UIColor colorWithRed:0.14
                                                           green:0.66
                                                            blue:0.20
                                                           alpha:0.7] CGColor];
    */
     [self.view addSubview:listButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)subjectButtonTapped:(id)sender {
    
    SubjectListViewController *subVC = [[SubjectListViewController alloc] initWithFrame:self.view.frame];
    [self.navigationController pushViewController:subVC animated:YES];
    
}

- (void)listButtonTapped:(id)sender {
    if (_vocabListVC == nil) {
        _vocabListVC = [[VocabListViewController alloc] initWithFrame:self.view.frame];
    }
    [self.navigationController pushViewController:_vocabListVC animated:YES];
}

//code from http://www.tutorialspoint.com/ios/ios_ui_elements_text_field.htm
// This method enables or disables the processing of return key
-(BOOL) searchBarShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    CephalopodViewController *cephVC = [[CephalopodViewController alloc] initWithFrame:self.view.frame];
    [self.navigationController pushViewController:cephVC animated:YES];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
