#import <Foundation/Foundation.h>

int main (int argc, char *argv[])
{
    @autoreleasepool {
        int count = 1;
        while ( count <= 5 ) {
            NSLog(@"%i", count);
            ++count;
        }
    }
    return 0;
}
