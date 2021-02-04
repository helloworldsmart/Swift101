//
//  main.m
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Square.h"
#import "XYPoint.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Rectangle *myRect = [[Rectangle alloc] init];
    XYPoint *myPoint = [[Rectangle alloc] init];
    
    // TODO: Thread 1: "-[Rectangle setX:andY:]: unrecognized selector sent to instance 0x10400a8c0"
    [myPoint setX: 100 andY: 200];
    
    [myRect setWidth:5 andHeight: 8];
    myRect.origin = myPoint;
    
    NSLog(@"Rectangle w = %i, h = %i", myRect.width, myRect.height);
    
    NSLog(@"Origin at (%i, %i)", myRect.origin.x, myRect.origin.y);
    
    NSLog(@"Area = %i, Perimeter = %i", [myRect perimeter]);
  }
  return 0;
}
