//
//  Pensioners.m
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "Pensioners.h"

@implementation Pensioners

-(id)init {
    self = [super init];
    if (self) {
        NSNotificationCenter *averagePriceNotification = [NSNotificationCenter defaultCenter];
        [averagePriceNotification addObserver:self
                                     selector:@selector(averagePriceChanged:)
                                     name:GovernmentAveragePriceNotifiction
                                     object:nil];
    }
    return self;
}


-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void) averagePriceChanged:(NSNotification*)notification {
    
    NSNumber* value = [notification.userInfo valueForKey:GovernmentAveragePriceUserInfoKey];
    float averagePrice = [value floatValue];
    
    if (averagePrice>self.averagePrice) {
        NSLog(@"Unexpected prices");
    } else {
        NSLog(@"Let's buy another Porsche");
    }
    self.averagePrice = averagePrice;
}
@end

