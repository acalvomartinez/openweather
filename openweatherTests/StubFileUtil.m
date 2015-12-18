//
//  StubFileUtil.m
//  Radars
//
//  Created by Toni on 07/10/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "StubFileUtil.h"

@implementation StubFileUtil

+ (NSDictionary *)dictionaryWithJSONStubFileNamed:(NSString *)stubFilename {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *filePath = [bundle pathForResource:stubFilename ofType:@"json"];
    
    NSString *dataString = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
}



@end
