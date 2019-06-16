////  LHLOrderedDictionary.h
// Created: 2019-06-16
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LHLOrderedDictionary : NSObject

/// Imports all key/values from dict and returns a new LHLOrderedDictionary instance.
+(instancetype)orderedDictionaryWithDictionary:(NSDictionary*)dict;

/// Associates 'object' with 'key'. The key will be kept in the correct position depending on its
/// alphabetical position relative to other keys. If an object is already associated with this key,
/// it is replaced.
-(void)setObject:(id)object forKey:(NSString*)key;

/// returns the object associated with key, nil if none.
-(id)objectForKey:(NSString*)key;

/// returns the key at a given index - an out-of-bounds index may cause an error
-(NSString*)keyAtIndex:(NSInteger)index;

/// the position of 'key' in the ordered dictionary or NSNotFound if the key is not in the dictionary
-(NSInteger)indexOfKey:(NSString*)key;

/// The number of key/value pairs in the dictionary
-(NSUInteger)count;

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id  _Nullable __unsafe_unretained * _Nonnull)buffer count:(NSUInteger)len;

@end

NS_ASSUME_NONNULL_END
