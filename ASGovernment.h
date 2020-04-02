//
//  ASGovernment.h
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString* const GovernmentSalaryNotifiction;
extern NSString* const GovernmentAveragePriceNotifiction;
extern NSString* const GovernmentTaxLevelNotifiction;

extern NSString* const GovernmentSalaryUserInfoKey;
extern NSString* const GovernmentAveragePriceUserInfoKey;
extern NSString* const GovernmentTaxLevelUserInfoKey;

@interface ASGovernment : NSObject

@property(nonatomic, assign) float salary;
@property(nonatomic, assign) float averagePrice;
@property(nonatomic, assign) float taxLevel;

@end

NS_ASSUME_NONNULL_END
