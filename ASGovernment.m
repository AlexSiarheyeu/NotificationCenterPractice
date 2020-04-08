//
//  ASGovernment.m
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "ASGovernment.h"

NSString* const GovernmentSalaryNotifiction = @"GovernmentSalaryNotifiction";
NSString* const GovernmentAveragePriceNotifiction = @"GovernmentAveragePriceNotifiction";
NSString* const GovernmentTaxLevelNotifiction = @"GovernmentTaxLevelNotifiction";

NSString* const UIApplicationWillResignActiveNotification = @"UIApplicationWillResignActiveNotification";
NSString* const UIApplicationDidBecomeActiveNotification = @"UIApplicationDidBecomeActiveNotification";

NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";
NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";

@implementation ASGovernment

-(id) init {
    self = [super init];
    if (self) {
        _salary = 1000;
        _averagePrice = 300;
        _taxLevel = 20;
        
        
        NSNotificationCenter *willResignActiveNotification = [NSNotificationCenter defaultCenter];
        [willResignActiveNotification addObserver:self
                           selector:@selector(willResignActiveNotification:)
                           name:UIApplicationWillResignActiveNotification
                           object:nil];
        
        NSNotificationCenter *didBecomeNotification = [NSNotificationCenter defaultCenter];
        [didBecomeNotification addObserver:self
                            selector:@selector(didBecomeNotification:)
                            name:UIApplicationDidBecomeActiveNotification
                            object:nil];
        
    }
    return self;
}

-(void)willResignActiveNotification:(NSNotification*)notification {
    NSLog(@"Government goes to sleep");
}

-(void)didBecomeNotification:(NSNotification*)notification {
    NSLog(@"Government wake up");
}


-(void)setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary *salaryDictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: GovernmentSalaryNotifiction                                                                        object:nil
                                          userInfo:salaryDictionary];
}


-(void)setAveragePrice:(float)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary *averagePriceDictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]
                                    postNotificationName:GovernmentAveragePriceNotifiction
                                    object:nil
                                    userInfo:averagePriceDictionary];
}


-(void) setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary *taxLevelDictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelNotifiction
                                          object:nil
                                          userInfo:taxLevelDictionary];
}




@end
