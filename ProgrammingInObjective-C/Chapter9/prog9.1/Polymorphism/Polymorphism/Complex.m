//
//  Complex.m
//  Polymorphism
//
//  Created by Michael on 2021/2/19.
//

#import "Complex.h"

@implementation Complex

@synthesize real, imaginary;

-(void) print
{
  NSLog(@" %g + %gi", real, imaginary);
}

-(void) setReal: (double) a andImaginary: (double) b
{
  real = a;
  imaginary = b;
}

-(Complex *) add: (Complex *) f
{
  Complex *result = [[Complex alloc] init];
  
  result.real = real + f.real;
  result.imaginary = imaginary + f.imaginary;
  
  return  result;
}

@end
