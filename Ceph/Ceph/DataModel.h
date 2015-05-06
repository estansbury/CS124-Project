//
//  DataModel.h
//  Ceph
//
//  Created by Rachel Wilson on 4/29/15.
//  Copyright (c) 2015 Emily Stansbury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

- (NSDictionary*)getVocabLists;
- (NSDictionary*)getBrowseTree;

- (NSArray*)getVocabListsAsArray;

- (BOOL)wordIsDefined:(NSString*)word;

- (void)addNewVocabList:(NSString*)listName;
- (void)addWord:(NSString*)word toList:(NSString*)list;

@end
