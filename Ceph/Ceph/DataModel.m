//
//  DataModel.m
//  Ceph
//
//  Created by Rachel Wilson on 4/29/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import "DataModel.h"
#import "AppDelegate.h"

@interface DataModel ()
{
    NSMutableDictionary *_vocabLists;
    NSDictionary *_browseTree;
    NSArray *_allWords;
}
@end

@implementation DataModel

- (instancetype)init
{
    NSMutableDictionary *currentLists = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).vocabLists;
    if (currentLists == nil) {
        [self createVocabLists];
    }
    else {
        _vocabLists = currentLists;
    }
    
    NSDictionary *currentTree = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).browseTree;
    if (currentTree == nil) {
        [self createBrowseTree];
    }
    else {
        _browseTree = currentTree;
    }
    return self;
}

- (void)createVocabLists
{
    NSArray *listNames = @[@"Earth Science", @"Vertibrates", @"Cool Words"];
    _vocabLists = [[NSMutableDictionary alloc] init];
    for (NSString *list in listNames) {
        NSMutableArray *words = [[NSMutableArray alloc] init];
        [_vocabLists setObject:words forKey:list];
    }
    ((AppDelegate*)[[UIApplication sharedApplication] delegate]).vocabLists = _vocabLists;
}

- (void)createBrowseTree
{
    NSArray *subjects = @[@"Anthropology", @"Astronomy", @"Biology", @"Chemistry", @"Geology", @"Physics"];
    NSArray *bioSubjects = @[@"Anatomy", @"Biochemistry", @"Cell Biology", @"Ecology", @"Genetics", @"Mycology", @"Zoology"];
    NSMutableDictionary *browseTree = [[NSMutableDictionary alloc] init];
    for (NSString *subject in subjects) {
        NSMutableDictionary *subjectDict = [[NSMutableDictionary alloc] init];
        
        if ([subject isEqualToString:@"Biology"]) {
            for (NSString *cat in bioSubjects) {
                NSArray *words;
                if ([cat isEqualToString:@"Zoology"]) {
                    words = @[@"Abdomen", @"Amphibians", @"Bilateral Symmetry", @"Bipedal", @"Cephalopod", @"Coelenterates", @"Delphinidae"];
                }
                else {
                    words = @[];
                }
                
                [subjectDict setObject:words forKey:cat];
                
            }
        }
        else {
            NSArray *words = @[];
            [subjectDict setObject:words forKey:@"All"];
        }
        
        [browseTree setObject:subjectDict forKey:subject];
        
    }
    
    ((AppDelegate*)[[UIApplication sharedApplication] delegate]).browseTree = _browseTree;
}

- (NSDictionary*)getVocabLists
{
    return [NSDictionary dictionaryWithDictionary:_vocabLists];
}
- (NSDictionary*)getBrowseTree
{
    return _browseTree;
}

- (BOOL)wordIsDefined:(NSString*)word
{
    return [_allWords containsObject:word];
}

- (void)addNewVocabList:(NSString*)listName
{
    [_vocabLists setObject:[[NSMutableArray alloc] init] forKey:listName];
    ((AppDelegate*)[[UIApplication sharedApplication] delegate]).vocabLists = _vocabLists;
    
}
- (void)addWord:(NSString*)word toList:(NSString*)list
{
    [(NSMutableArray*)[_vocabLists objectForKey:list] addObject:word];
}

@end
