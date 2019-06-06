//
//  ApartmentLayout.m
//  ProgrammaticNavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ApartmentLayout.h"
#import "Room.h"

@implementation ApartmentLayout
static ApartmentLayout *_apartmentLayout;

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary* roomsDictionary
        = @{@"Door Way":@"front_door",
            @"Coat Room":@"coat_room",
            @"Library":@"library",
            @"Dining Room":@"dining_room",
            @"Stairs Up":@"stairs_up",
            @"Secret Passage":@"secret_passage",
            @"Dungeon":@"dungeon",
            @"Labratory":@"labratory",
            @"Mysterious Lake":@"mysterious_lake",
            @"Generator":@"generator",
            @"Cursed Chalice":@"cursed_chalice",
            @"Kitchen":@"kitchen",
            @"Back Porch":@"back_porch",
            @"Bedroom":@"bedroom",
            @"Bathroom":@"bathroom"
            };
        
        NSDictionary* doorsDictionary
        = @{@"Door Way":@[@"Coat Room"],
            @"Coat Room":@[@"Library",@"Dining Room",@"Stairs Up"],
            @"Library":@[@"Secret Passage"],
            @"Secret Passage":@[@"Dungeon",@"Labratory",@"Mysterious Lake"],
            @"Labratory":@[@"Generator"],
            @"Mysterious Lake":@[@"Cursed Chalice"],
            @"Dining Room":@[@"Kitchen"],
            @"Kitchen":@[@"Back Porch"],
            @"Stairs Up":@[@"Bedroom",@"Bathroom"]
            };
        
        _mainDoor = [ApartmentLayout buildLayout:roomsDictionary withDoors:doorsDictionary andRoot:@"Door Way"];
        
        
    }
        //Room *doorway = [[Room alloc] initWithName:@"Door Way" andImageName:@"front-door"];
        //Room *
    return self;
}

+(Room *)buildLayout:(NSDictionary *) rooms
           withDoors:(NSDictionary *) doors
             andRoot:(NSString *) root;
{
    NSMutableDictionary *roomObjectDictionary = [NSMutableDictionary new];
    
    for(NSString* roomName in rooms) {
        Room *roomObject = [[Room alloc] initWithName:roomName andImageName:rooms[roomName]];
        roomObjectDictionary[roomName] = roomObject;
    }
    
    for(NSString* roomName in doors) {
        NSMutableArray *roomConnections = [NSMutableArray new];
        for(NSString *doorTo in doors[roomName]) {
            [roomConnections addObject:roomObjectDictionary[doorTo]];
        }
        ((Room *)roomObjectDictionary[roomName]).hasDoorsTo = roomConnections;
    }
    return roomObjectDictionary[root];
}

+(Room *)mainDoor {
    if ( !_apartmentLayout) {
        _apartmentLayout = [ApartmentLayout new];
    }
    return _apartmentLayout.mainDoor;
}
@end
