#import <Foundation/Foundation.h>

int main (int argc, char * argv[])
{
    @autoreleasepool {
        int n, sum = 1;
        for (n = 1; n <= 10; ++n) {
            sum *= n; 
            NSLog(@"%2i   %8i", n, sum);
        }
    }
    return 0; 
}
