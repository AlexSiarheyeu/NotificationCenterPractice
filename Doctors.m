//
//  Doctors.m
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "Doctors.h"

@implementation Doctors

-(id)init {
    self = [super init];
    if (self) {
       
        NSNotificationCenter *salaryChangeNotification = [NSNotificationCenter defaultCenter];
        [salaryChangeNotification addObserver:self selector:@selector(salaryChanged:) name:GovernmentSalaryNotifiction object:nil];
        
        NSNotificationCenter *averagePriceNotification = [NSNotificationCenter defaultCenter];
        [averagePriceNotification addObserver:self selector:@selector(averagePriceChanged:) name:GovernmentAveragePriceNotifiction object:nil];
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)salaryChanged:(NSNotification*)notification {
    
    NSNumber *value = [notification.userInfo valueForKey:GovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    
    if(salary < self.salary) {
        NSLog(@"In our country doctors have small salary, only %1.f", salary);
    } else {
        NSLog(@"Oh, finally, I am happy, now my salary is %1.f", salary);
    }
    self.salary = salary;
}

-(void)averagePriceChanged:(NSNotification*)notification {
    NSNumber *value = [notification.userInfo valueForKey:GovernmentAveragePriceUserInfoKey];
    float averagePrice = [value floatValue];
    
    if (averagePrice > (self.salary*20)/100) {
        NSLog (@"Unfortunately, I can't buy this piece of marble beef, because now average price is %1.f", averagePrice);
    } else {
        NSLog(@"Great, I'll buy a new chair, now average price is %1.f", averagePrice);
    }
    
}


@end
