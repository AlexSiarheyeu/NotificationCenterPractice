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

NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";
NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";

@implementation ASGovernment

-(id) init {
    self = [super init];
    if (self) {
        _salary = 1000;
        _averagePrice = 300;
        _taxLevel = (_salary*20)/100;
    }
    return self;
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
