//
//  Rectangle.m
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import "Rectangle.h"
#import "XYPoint.h"

@implementation Rectangle
{
  XYPoint *origin;
}

@synthesize width, height;

-(void) setWidth: (int)w andHeight: (int) h
{
  width = w;
  height = h;
}

-(void) setOrigin: (XYPoint *) pt
{
  origin = pt;
}

-(int) area
{
  return width * height;
}

-(int) perimeter
{
  return (width + height) * 2;
}

-(XYPoint *) origin
{
  return origin;
}
@end
