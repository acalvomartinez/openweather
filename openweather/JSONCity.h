//
//  OWMCity.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONCity : NSObject

@property (nonatomic, assign) NSUInteger cityId;
@property (nonatomic, copy) NSString *name;

+ (instancetype)cityWithId:(NSUInteger)cityId
                      name:(NSString *)name;

@end
