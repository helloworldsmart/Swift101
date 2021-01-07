#import <Foundation/Foundation.h>

//---- @interface section ----

@interface Cartesian: NSObject

-(void) print;
-(void) setX: (int) x;
-(void) setY: (int) y;
-(int) xValue;
-(int) yValue; 

@end

// ----@implementation section ----

@implementation Cartesian
{
  int xValue;
  int yValue;
}

-(void) print
{
  NSLog(@"What is value of x: %i and value of y: %i", xValue, yValue);
}

-(void)setX: (int) x
{
  xValue = x;
}

-(void)setY: (int) y
{
  yValue = y;
}

-(int) xValue
{
  return xValue;
}

-(int) yValue
{
  return yValue;
}

@end

//---- program section ----

int main(int argc, char *argv[])
{
  @autoreleasepool {
    Cartesian *myCartesian = [[Cartesian alloc] init];

    [myCartesian setX: 7];
    [myCartesian setY: 8];

    NSLog(@"The value of x is: %i", [myCartesian xValue]);
    NSLog(@"The value of y is: %i", [myCartesian yValue]);

  }
  return 0;
}



