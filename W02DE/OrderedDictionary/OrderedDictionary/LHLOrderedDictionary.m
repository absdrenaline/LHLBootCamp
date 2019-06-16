////  LHLOrderedDictionary.m
// Created: 2019-06-16
//


#import "LHLOrderedDictionary.h"

@implementation LHLOrderedDictionary {
    NSMutableArray* arrayOfKeys;
    NSMutableDictionary* dictionary;
}

-(instancetype) initWithDictionary:(NSDictionary*)dict {
    self = [super init];
    if (self) {
        dictionary = [NSMutableDictionary dictionaryWithDictionary:dict];
        arrayOfKeys = [[dictionary keysSortedByValueUsingSelector:@selector(localizedStandardCompare:)] copy];
    }
    return self;
}

//-(NSComparisonResult)stringComparator:(id)obj1 with:(id) obj2 {
//    if ([obj1 isGreaterThan:obj2]) {
//        return (NSComparisonResult)NSOrderedDescending;
//    }
//
//    if ([obj2 isGreaterThan:obj1]) {
//        return (NSComparisonResult)NSOrderedAscending;
//    }
//    return (NSComparisonResult)NSOrderedSame;
//}

/// Imports all key/values from dict and returns a new LHLOrderedDictionary instance.
+(instancetype)orderedDictionaryWithDictionary:(NSDictionary*)dict {
    return [[LHLOrderedDictionary alloc] initWithDictionary:dict];
}

/// Associates 'object' with 'key'. The key will be kept in the correct position depending on its
/// alphabetical position relative to other keys. If an object is already associated with this key,
/// it is replaced.
-(void)setObject:(id)object forKey:(NSString*)key {
    if ([dictionary objectForKey:key] == nil) {
        NSUInteger newIndex = [arrayOfKeys indexOfObject:key
                                     inSortedRange:(NSRange){0, [arrayOfKeys count]}
                                           options:NSBinarySearchingInsertionIndex
                                         usingComparator:^(id obj1, id obj2 ) {
                                             return [obj1 localizedCompare:obj2];
                                         }];
        [arrayOfKeys insertObject:key atIndex:newIndex];
    }
    [dictionary setObject:object forKey:key];
}

/// returns the object associated with key, nil if none.
-(id)objectForKey:(NSString*)key {
    return [dictionary objectForKey:key];
}

/// returns the key at a given index - an out-of-bounds index may cause an error
-(NSString*)keyAtIndex:(NSInteger)index {
    return arrayOfKeys[index];
}

/// the position of 'key' in the ordered dictionary or NSNotFound if the key is not in the dictionary
-(NSInteger)indexOfKey:(NSString*)key {
    return [arrayOfKeys indexOfObject:key];
}

/// The number of key/value pairs in the dictionary
-(NSUInteger)count {
    return [arrayOfKeys count];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id  _Nullable __unsafe_unretained * _Nonnull)buffer count:(NSUInteger)len {
    return [arrayOfKeys countByEnumeratingWithState:state objects:buffer count:len];
}
@end
