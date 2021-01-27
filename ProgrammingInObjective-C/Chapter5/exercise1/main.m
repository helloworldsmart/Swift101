#import <Foundation/Foundation.h>

int main(int argc, char * argv[])
{
    @autoreleasepool {
        int n, number;

        NSLog(@"TABLE OF N * N");
        NSLog(@"-- -----------");
        number = 0;
        for ( n = 1; n <= 10; ++n) {
            number = n * n;
            NSLog(@"%2i      %4i", n, number);
        }
    }
    return 0;
}
