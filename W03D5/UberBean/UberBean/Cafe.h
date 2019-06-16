////  Cafe.h
// Created: 2019-06-15
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cafe : NSObject<MKAnnotation>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *latitude;
//@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(instancetype) initWithIdentifier:(NSString *) identifier;

@end

NS_ASSUME_NONNULL_END
