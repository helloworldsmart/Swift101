#import <Foundation/Foundation.h>

int main (int argc, char * argv[])
{
    @autoreleasepool {
        int number, right_digit;

        NSLog(@"Enter your number.");
        scanf("%i", &number);

        do {
            right_digit = number % 10;
            NSLog(@"%i", right_digit);
            number /= 10;
        }
        while ( number != 0);
    }
    return 0;
}
