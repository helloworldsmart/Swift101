//
//  main.m
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import "RectangleClass.h"
#import "Square.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    RectangleClass *myRect = [[RectangleClass alloc] init];
    [myRect setWidth: 5 andHeight: 8];
    
    NSLog(@"Rectangle w = %i, h = %i", myRect.width, myRect.height);
    NSLog(@"Area = %i, Perimeter = %i", [myRect area], [myRect perimeter]);
    
    Square *mySquare = [[Square alloc] init];
    
    [mySquare setSide: 5];
    
    NSLog(@"Square s = %i", [mySquare side]);
    NSLog(@"Area = %i Perimeter = %i", [mySquare area], [mySquare perimeter]);
  }
  return 0;
}
