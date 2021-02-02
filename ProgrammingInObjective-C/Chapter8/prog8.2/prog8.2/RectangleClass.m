//
//  Rectangle.m
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import "RectangleClass.h"
@implementation RectangleClass
@synthesize width, height;
-(void) setWidth: (int)w andHeight: (int) h
{
  width = w;
  height = h;
}

-(int) area
{
  return width * height;
}

-(int) perimeter
{
  return (width + height);
}
@end
