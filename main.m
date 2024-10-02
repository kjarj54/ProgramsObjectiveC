#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  // Create autorelease pool

    NSLog(@"Hello World, Objective-C");

    [pool drain];  // Drain autorelease pool
    return 0;
}
