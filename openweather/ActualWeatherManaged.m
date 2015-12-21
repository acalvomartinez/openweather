#import "ActualWeatherManaged.h"

@interface ActualWeatherManaged ()

// Private interface goes here.

@end

@implementation ActualWeatherManaged

-(NSArray *)sortedForecast {
    NSSortDescriptor *sortNameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortNameDescriptor, nil];
    
    return [[self.forecast allObjects] sortedArrayUsingDescriptors:sortDescriptors];
}


@end