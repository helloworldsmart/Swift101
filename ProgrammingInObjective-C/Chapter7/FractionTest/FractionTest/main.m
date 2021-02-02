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
    
    Fraction *resultFraction;
    
    [aFraction setTo: 1 over: 4];
    [bFraction setTo: 1 over: 2];
    
    [aFraction print];
    NSLog(@"+");
    [bFraction print];
    NSLog(@"=");
    
    resultFraction = [aFraction add: bFraction];
    [resultFraction print];
  }
  return 0;
}
