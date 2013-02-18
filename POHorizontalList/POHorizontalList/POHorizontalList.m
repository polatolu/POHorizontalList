//
//  POHorizontalList.m
//  POHorizontalList
//
//  Created by Polat Olu on 15/02/2013.
//  Copyright (c) 2013 Polat Olu. All rights reserved.
//

#import "POHorizontalList.h"

@implementation POHorizontalList

- (id)initWithFrame:(CGRect)frame title:(NSString *)title items:(NSMutableArray *)items
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, TITLE_HEIGHT, self.frame.size.width, self.frame.size.height)];

        CGSize pageSize = CGSizeMake(ITEM_WIDTH, self.scrollView.frame.size.height);
        NSUInteger page = 0;
        
        for(ListItem *item in items) {
            [item setFrame:CGRectMake(LEFT_PADDING + (pageSize.width + DISTANCE_BETWEEN_ITEMS) * page++, 0, pageSize.width, pageSize.height)];
            
            UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapped:)];
            [item addGestureRecognizer:singleFingerTap];

            [self.scrollView addSubview:item];
        }
        
        self.scrollView.contentSize = CGSizeMake(LEFT_PADDING + (pageSize.width + DISTANCE_BETWEEN_ITEMS) * [items count], pageSize.height);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        
        [self addSubview:self.scrollView];
        
        // Title Label
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_PADDING, 0.0, self.frame.size.width, TITLE_HEIGHT)];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [titleLabel setTextColor:[UIColor colorWithWhite:116.0/256.0 alpha:1.0]];
        [titleLabel setShadowColor:[UIColor whiteColor]];
        [titleLabel setShadowOffset:CGSizeMake(1.0, 1.0)];
        [titleLabel setOpaque:YES];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:titleLabel];
        
        // Background shadow
        CAGradientLayer *dropshadowLayer = [CAGradientLayer layer];
        dropshadowLayer.contentsScale = scale;
        dropshadowLayer.startPoint = CGPointMake(0.0f, 0.0f);
        dropshadowLayer.endPoint = CGPointMake(0.0f, 1.0f);
        dropshadowLayer.opacity = 1.0;
        dropshadowLayer.frame = CGRectMake(1.0f, 1.0f, self.frame.size.width - 2.0, self.frame.size.height - 2.0);
        dropshadowLayer.locations = [NSArray arrayWithObjects:
                                     [NSNumber numberWithFloat:0.0f],
                                     [NSNumber numberWithFloat:1.0f], nil];
         dropshadowLayer.colors = [NSArray arrayWithObjects:
                                   (id)[[UIColor colorWithWhite:224.0/256.0 alpha:1.0] CGColor],
                                   (id)[[UIColor colorWithWhite:235.0/256.0 alpha:1.0] CGColor], nil];
         
         [self.layer insertSublayer:dropshadowLayer below:self.scrollView.layer];

    }

    return self;
}

- (void)itemTapped:(UITapGestureRecognizer *)recognizer {
    ListItem *item = (ListItem *)recognizer.view;

    if (item != nil) {
        [self.delegate didSelectItem:item];
    }
}

@end
