//
//  main.m
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import "RectangleClass.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      // insert code here...
//      NSLog(@"Hello, World!");
    RectangleClass *myRect = [[RectangleClass alloc] init];
    [myRect setWidth: 5 andHeight: 8];
    
    NSLog(@"Rectangle w = %i, h = %i", myRect.width, myRect.height);
    NSLog(@"Area = %i, Perimeter = %i", [myRect area], [myRect perimeter]);
    return 0;
    
  }
  return 0;
}
