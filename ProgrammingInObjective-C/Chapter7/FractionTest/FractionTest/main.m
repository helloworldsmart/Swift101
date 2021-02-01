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
    
    [myFraction setNumerator: 1];
    [myFraction setDenominator: 3];
    
    // display the fraction
    
    NSLog(@"The value of myFraction is:");
    [myFraction print];
  }
  return 0;
}
