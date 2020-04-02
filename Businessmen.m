//
//  Businessmen.m
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "Businessmen.h"
#import "ASGovernment.h"

@implementation Businessmen

-(id)init {
    self = [super init];
    if (self) {
        
        NSNotificationCenter *taxLevelChanged = [NSNotificationCenter defaultCenter];
        [taxLevelChanged addObserver:self selector:@selector(taxLevelChanged:) name: GovernmentTaxLevelNotifiction object:nil];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)taxLevelChanged:(NSNotification*)notification {
    
    NSNumber* value = [notification.userInfo valueForKey:GovernmentTaxLevelUserInfoKey];
    float taxLevel = [value floatValue];
    
    if (taxLevel > self.taxLevel) {
        NSLog(@"A tax is really big - %1.f", taxLevel);
    } else {
        NSLog(@"Great taxes - %1.f", taxLevel);
    }
    self.taxLevel = taxLevel;
}


@end
