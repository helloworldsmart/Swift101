//
//  main.m
//  Polymorphism
//
//  Created by Michael on 2021/2/19.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Complex.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSArray *myArray = [NSArray array];
    
    @try {
      [myArray objectAtIndex: 2];
    } @catch (NSException *exception) {
      NSLog(@"Caught %@%@", exception.name, exception.reason);
    }
    
    NSLog(@"Execution continues");
  }
  return 0;
}
