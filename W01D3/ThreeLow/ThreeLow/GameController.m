//
//  GameController.m
//  ThreeLow
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "GameController.h"
#include "Dice.h"

const int kMaxMoves = 5;

@implementation GameController {
    UInt numberOfDices;
    NSArray* gameDices;
    NSMutableSet* heldDiceIndices;
    const char* holdChar;
}

- (NSArray*) createDices:(UInt) count
{
    NSMutableArray* dices = [[NSMutableArray alloc] initWithCapacity:count];
    while (count--) {
        [dices addObject:[Dice new]];
    }
    return [dices copy];
}

- (void) updateScore {
    UInt total = 0;
    for(Dice* dice in gameDices) {
        if (dice.value != 3) {
            total += dice.value;
        }
    }
    _currentScore = total;
    if ( total < _lowestScore)
        _lowestScore = total;
}

- (instancetype)initWithDiceCount:(UInt) diceCount
{
    self = [super init];
    if (self) {
        holdChar = "🔒";
        numberOfDices = diceCount;
        heldDiceIndices = [[NSMutableSet alloc] initWithCapacity:diceCount];
        gameDices = [self createDices:diceCount];
        [self updateScore];
        _lowestScore = _currentScore;
        _availableMoves = kMaxMoves;
    }
    return self;
}

- (instancetype)init {
    return [self initWithDiceCount:5];
}

- (void)printScores {
    printf("Your Score: %u, Lowest Score: %u, Rolls left: %u\n",
           self.currentScore,self.lowestScore,self.availableMoves);
    printf("Remember a 3 on dice counts as a 0\n");
    
}

- (void)printRolls {
    printf("Rolls: \t");
    for(Dice* dice in gameDices) {
        //printf("%u  ",dice.value);
        printf("%s\t",[dice.valueSymbol cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)printHolds {
    printf("Holds:\t");
    for (int i=0; i < numberOfDices; i++) {
        if([heldDiceIndices containsObject:[NSNumber numberWithInt:i]]) {
            printf("%s\t",holdChar);
        }
        else {
            printf("\t");
        }
    }
    printf("\n");
}

- (void)printDiceIndices {
    printf("Dice: \t");
    for (int i=1; i <= numberOfDices; i++) {
        printf("%i\t",i);
    }
    printf("\n");
}

- (void) print {
    
    [self printDiceIndices];
    [self printHolds];
    [self printRolls];
    
    printf("\n\n");
    
    [self printScores];
    
    printf("--------------------------------------\n");
}
- (void)holdDice:(int)index {
    if (index < 1)
        return;
    
    NSNumber *normalizedIndex = [NSNumber numberWithInt:index - 1];
    if ([heldDiceIndices containsObject:normalizedIndex]) {
        [heldDiceIndices removeObject:normalizedIndex];
    } else {
        [heldDiceIndices addObject:normalizedIndex];
    }
}

- (BOOL)shouldRoll{
    if([heldDiceIndices count] == 0 || _availableMoves <= 0)
        return NO;
    return YES;
}

- (void)roll {
    for(int i=0; i< numberOfDices; i++) {
        if(![heldDiceIndices containsObject:[NSNumber numberWithInt:i]])
            [gameDices[i] roll];
    }
    [self updateScore];
    _availableMoves--;
}

-(void)resetDice {
    [heldDiceIndices removeAllObjects];
    _availableMoves = kMaxMoves+1;
    [self roll];
}
@end
