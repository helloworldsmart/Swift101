//
//  Square.m
//  prog8.2
//
//  Created by Michael on 2021/2/3.
//

#import "Square.h"

@implementation Square: RectangleClass

-(void) setSide: (int) s
{
  [self setWidth: s andHeight: s];
}

-(int) side
{
  return self.width;
}
@end
