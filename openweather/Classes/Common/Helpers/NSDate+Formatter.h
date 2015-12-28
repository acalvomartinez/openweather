//
//  NSError+NSDate_Formatter.h
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

- (NSString *)dayOfTheWeek;
- (NSString *)hourOfTheDay;

@end
