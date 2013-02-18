//
//  POHorizontalListDelegate.h
//  POHorizontalList
//
//  Created by Polat Olu on 16/02/2013.
//  Copyright (c) 2013 Polat Olu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItem.h"

@protocol POHorizontalListDelegate <NSObject>

- (void) didSelectItem:(ListItem *)item;

@end
