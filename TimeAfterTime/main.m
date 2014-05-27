//
//  main.m
//  TimeAfterTime
//
//  Created by mm on 5/25/14.
//  Copyright (c) 2014 mm. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [[NSDate alloc] init];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1987];
        [comps setMonth:12];
        [comps setDay:16];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        double d = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"I have been lived %f seconds", d);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSUInteger day = [cal ordinalityOfUnit: NSHourCalendarUnit
                                        inUnit: NSDayCalendarUnit
                                       forDate:now];
        NSLog(@"This is hour %lu of today", day);

        NSTimeZone *tz = [NSTimeZone systemTimeZone];
        BOOL result = [tz isDaylightSavingTime];
        NSLog(@"tz is %@", tz);
        if (result == false) {
            NSLog(@"you are not in day light saving time.");
        } else {
            NSLog(@"you are in day light saving time.");
        }

        NSHost *currentHost = [NSHost currentHost];
        NSString *localizeName = [currentHost localizedName];
        NSLog(@"current host is %@", localizeName);
    }

    return 0;
}