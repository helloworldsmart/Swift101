#import <Foundation/Foundation.h>

int main (int argc, char * argv[])
{
    @autoreleasepool {
        int n, number, triangularNumber, counter, counterLevel;

        NSLog(@"What counter level do you want?");
        scanf("%i", &counterLevel);
        for ( counter = 1; counter <= counterLevel; ++counter ) {
            NSLog(@"What triangular number do you want?");
            scanf("%i", &number);

            triangularNumber = 0;

            for ( n = 1; n <= number; ++n ) {
                triangularNumber += n;
            }

            NSLog(@"Triangular number %i is %i", number, triangularNumber);
        }
    }
    return 0;
}
