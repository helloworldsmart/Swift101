//
//  main.m
//  FractionTest
//
//  Created by Michael on 2021/2/1.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Fraction *myFraction = [[Fraction alloc] init];
    
    // set fraction to 1/3
    
//    [myFraction setNumerator: 1];
//    [myFraction setDenominator: 3];

    myFraction.numerator = 1;
    myFraction.denominator = 3;
    
    // display the fraction
    
//    NSLog(@"The value of myFraction is:");
//    [myFraction print];
    
    // display the fraction's numerator and denominator
    NSLog(@"The numerator is %i, and the denominator is %i", myFraction.numerator, myFraction.denominator);
    
    Fraction *aFraction = [[Fraction alloc] init];
    [aFraction setTo: 100 over: 200];
    [aFraction print];
    
    [aFraction setTo:1 over:3];
    [aFraction print];
    
  }
  return 0;
}
