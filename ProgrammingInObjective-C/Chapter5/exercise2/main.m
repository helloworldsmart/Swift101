#import <Foundation/Foundation.h>

int main (int argc, char * argv[])
{
    @autoreleasepool {
        int n, triangularNumber, counter;
        NSLog(@"TABLE");
        NSLog(@" n Sum of triangularNumber");
        NSLog(@"-- ------");
        for (counter = 5;  counter <= 50; counter += 5) {
            n = counter;
            triangularNumber = n * (n + 1) / 2;
            NSLog(@"%2i    %4i", n, triangularNumber);
        }
    }
    return 0;
}
