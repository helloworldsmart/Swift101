//
//  Fraction.m
//  FractionTest
//
//  Created by Michael on 2021/2/1.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void) print
{
  NSLog(@"%i/%i", numerator, denominator);
}

-(double) convertToNum
{
  if (denominator != 0) {
    return (double) numerator / denominator;
  } else {
    return NAN;
  }
}

-(void) setTo: (int) n over: (int) d
{
  numerator = n;
  denominator = d;
}

@end
