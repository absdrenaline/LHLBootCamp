//
//  ViewController.m
//  ProgrammaticNavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ViewController.h"
#import "Room.h"
#import "ApartmentLayout.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *containerStackView;
@property (weak, nonatomic) IBOutlet UIImageView *roomImageView;
@property (weak, nonatomic) IBOutlet UIStackView *roomNameStackView;
@property (assign, nonatomic) NSUInteger roomCount;

@end

@implementation ViewController


- (NSUInteger)roomCount {
    if (_roomCount < 1 )
        return 1;
    else
        return _roomCount % 10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.room) {
        _room = ApartmentLayout.mainDoor;
    } else {
        self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleDone target:self action:@selector(goHome)];
    }
    
    UIImage *roomImage = [UIImage imageNamed:_room.imageName];
    self.roomImageView.image = roomImage;
    
    for(Room* opensToRoom in self.room.hasDoorsTo) {
        UIButton *roomButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [roomButton setTitle:opensToRoom.name forState:UIControlStateNormal];
        [roomButton addTarget:self action:@selector(doNavigateToRoom:) forControlEvents:UIControlEventTouchUpInside];
        
        [roomButton sizeToFit];
    
        
         [self.roomNameStackView addArrangedSubview:roomButton];
    }
    
    [self adaptToOrientation:self.view.bounds.size];
}

- (void) doNavigateToRoom:(UIButton *) button {
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    ViewController *anotherViewController = [main instantiateViewControllerWithIdentifier:@"RoomView"];
    
    for(Room* opensToRoom in self.room.hasDoorsTo) {
        if([[button currentTitle] isEqualToString:opensToRoom.name]) {
            anotherViewController.room = opensToRoom;
        }
    
    }
    [self.navigationController pushViewController:anotherViewController animated:YES];
    
}

-(void)goHome {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)adaptToOrientation:(CGSize)size {
    switch( UIDevice.currentDevice.orientation) {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
            self.containerStackView.axis = UILayoutConstraintAxisVertical;
            NSLog(@"Potraits");
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            self.containerStackView.axis = UILayoutConstraintAxisHorizontal;
            NSLog(@"Landscapes");
            break;
        default:
            break;
            
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self adaptToOrientation:size];
}

@end
