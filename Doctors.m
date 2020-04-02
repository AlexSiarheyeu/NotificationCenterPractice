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
        
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)salaryChanged:(NSNotification*)notification {
    
    NSNumber *value = [notification.userInfo valueForKey:GovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"In our country doctors have small salary, only %1.f", salary);
    } else {
        NSLog(@"Oh, finally, I am happy, now my salary is %1.f", salary);
    }
    self.salary = salary;
}




@end
