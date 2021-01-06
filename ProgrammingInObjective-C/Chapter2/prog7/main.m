#import <Foundation/Foundation.h>

int main (int argc, const char *argv[]) {
  @autoreleasepool {
    int value1, value2, minus;
    value1 = 87;
    value2 = 15;
    minus = value1 - value2;
    NSLog(@"The result of %i mins %i is %i", value1, value2, minus);
  }
  return 0;
}
