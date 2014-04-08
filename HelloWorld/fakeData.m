//
//  fakeData.m
//  HelloWorld
//
//  Created by Wendy Lorimer on 4/2/14.
//  Copyright (c) 2014 WendyLorimer. All rights reserved.
//

#import "fakeData.h"

@implementation fakeData



-(int)dataPoint:(int)maxValue
{
    // random number
    return (arc4random_uniform(maxValue));
}

@end
