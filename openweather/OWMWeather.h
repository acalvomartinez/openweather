//
//  OWMWeather.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWMWeather : NSObject

@property (nonatomic, assign) NSUInteger weatherId;
@property (nonatomic, copy) NSString *group;
@property (nonatomic, copy) NSString *condition;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon;

@end
