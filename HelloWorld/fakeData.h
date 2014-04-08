//
//  fakeData.h
//  HelloWorld
//
//  Created by Wendy Lorimer on 4/2/14.
//  Copyright (c) 2014 WendyLorimer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface fakeData : NSObject

// returns a single fake data point (an integer between 0 and maxValue)

-(int)dataPoint:(int)maxValue;

@end
