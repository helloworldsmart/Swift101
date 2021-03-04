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
    Fraction *a, *b;
    a = [[Fraction alloc] initWith: 1 over: 3];
    b = [[Fraction alloc] initWith: 3 over: 7];
    
    [a print];
    [b print];
    
  }
  return 0;
}
