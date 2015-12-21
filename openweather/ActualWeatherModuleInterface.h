//
//  ActualWeatherModuleInterface.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActualWeatherModuleInterface <NSObject>

- (void)requestLocationServiceAuthorization;
- (void)updateView;

@end
