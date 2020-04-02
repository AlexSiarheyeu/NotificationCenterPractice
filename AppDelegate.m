//
//  AppDelegate.m
//  NotificationCenterPractice
//
//  Created by Alexey Sergeev on 4/2/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

#import "AppDelegate.h"
#import "ASGovernment.h"
#import "Doctors.h"

@interface AppDelegate()
@property (nonatomic,strong) ASGovernment* government;
@end

@interface AppDelegate ()
@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:GovernmentSalaryNotifiction object:nil];
    
    self.government = [[ASGovernment alloc]init];

    
    Doctors *Alec = [[Doctors alloc]init];
    Alec.salary = self.government.salary;
    
    self.government.salary = 900;
    self.government.salary = 1100;
    
    
    
    
    
    
    
    
    
    
    return YES;
}
-(void)governmentNotification:(NSNotification*)notification {
    NSLog(@"%@", notification.userInfo);
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
