#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
  @autoreleasepool {
    int i;
    i = 1;
    NSLog(@"Testing...");
    NSLog(@"....%i", i);
    NSLog(@"...%i", i + 1);
    NSLog(@"..%i", i + 2);
  }
  return 0;
}

/* Answer:
Testing...
....1
...2
..3
*/
