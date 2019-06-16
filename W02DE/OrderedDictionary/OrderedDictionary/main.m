////  main.m
// Created: 2019-06-16
//


#import <Foundation/Foundation.h>
#import "LHLOrderedDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LHLOrderedDictionary* orderedDictionary = [LHLOrderedDictionary orderedDictionaryWithDictionary:@{@"ZZZ": @"Object4", @"GGG": @"Object 2", @"JJJ": @"Object 3", @"AAA" : @"Object 1"}];
        // using the fast enumeration syntax to iterate through the items:
        for(NSString *key in orderedDictionary) {
            NSLog(@"Object for Key '%@' is '%@' at index %ld", key, [orderedDictionary objectForKey:key], (long)[orderedDictionary indexOfKey:key]);
        }
        
//        Expected Output:
//        Object for Key 'AAA' is 'Object 1' at index 1
//        Object for Key 'GGG' is 'Object 2' at index 2
//        Object for Key 'JJJ' is 'Object 3' at index 3
//        Object for Key 'ZZZ' is 'Object 4' at index 4
    }
    return 0;
}
