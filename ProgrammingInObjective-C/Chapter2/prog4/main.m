#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
  @autoreleasepool {
    int value1, value2, sum;

    value1 = 50;
    value2 = 25;
    sum = value1 + value2;
   
    NSLog(@"The sum of %i and %i is %i", value1, value2, sum); 
  }
  return 0;
}
