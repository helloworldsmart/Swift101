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

// add a Fraction to the receiver

-(Fraction *) add: (Fraction *) f
{
  // To add two fractions:
  // a/b + c/d = ((a*d) + (b*c)) / (b * d)
  
  Fraction *result = [[Fraction alloc] init];
  
  result.numerator = numerator * f.denominator + denominator * f.numerator;
  result.denominator = denominator * f.denominator;
  
  [self reduce];
  
  return result;
}

// TODO:
-(void) reduce
{
  int u = numerator;
  int v = denominator;
  int temp;
  
  while (v != 0) {
    temp = u % v;
    u = v;
    v = temp;
  }
  
  numerator /= u;
  denominator /= u;
}

@end
