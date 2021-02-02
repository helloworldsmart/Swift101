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
    Fraction *aFraction = [[Fraction alloc] init];
    Fraction *bFraction = [[Fraction alloc] init];
    
    Fraction *addResultFraction;
    Fraction *subtractResultFraction;
    Fraction *multiplyResultFraction;
    Fraction *divideResultFraction;
    
    [aFraction setTo: 1 over: 4];
    [bFraction setTo: 1 over: 2];
    
    addResultFraction = [aFraction add: bFraction];
    [addResultFraction print];
    
    subtractResultFraction = [aFraction subtract: bFraction];
    [subtractResultFraction print];
    
    multiplyResultFraction = [aFraction multiply: bFraction];
    [multiplyResultFraction print];
    
    divideResultFraction = [aFraction divide: bFraction];
    [divideResultFraction print];
  }
  return 0;
}
