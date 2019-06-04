//
//  GameModel.m
//  MathGame
//
//  Created by Arun on 2019-06-03.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"
#import "QuestionFactory.h"
#import "Question.h"

@implementation GameModel {
    NSArray* players;
    NSUInteger currentPlayerIndex;
    QuestionFactory *questionFactory;
    Question *activeQuestion;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        questionFactory = [QuestionFactory new];
        players = [NSArray arrayWithObjects:[[Player alloc] initWithName:@"Player 1"],
                   [[Player alloc] initWithName:@"Player 2"],
                   nil];
        currentPlayerIndex = [players count] - 1;
        
    }
    return self;
}
- (nonnull NSString *)nextTurn { 
    currentPlayerIndex = (currentPlayerIndex + 1) % [players count];
    activeQuestion = [questionFactory generateRandomQuestion];
    return activeQuestion.question;
}

- (BOOL)acceptAnswer:(NSString *)answer {
    float expectedAnswer = round([activeQuestion.answer floatValue] * 10)/10;
    float providedAnswer = round([answer floatValue] * 10)/10;
    
    if (!(expectedAnswer ==  providedAnswer)){
        Player *currentPlayer = players[currentPlayerIndex];
        currentPlayer.lives--;
        if (currentPlayer.lives == 0) {
            _isGameOver = YES;
        }
        return NO;
    }
    
    return YES;
}

- (NSUInteger)activePlayerScore {
    Player *currentPlayer = players[currentPlayerIndex];
    return currentPlayer.lives;
}

- (NSUInteger)playerScore:(NSUInteger)playerIndex {
    Player *currentPlayer = players[playerIndex];
    return currentPlayer.lives;
}

- (NSString *)playerName:(NSUInteger)playerIndex {
    Player *currentPlayer = players[playerIndex];
    return currentPlayer.name;
}

- (NSString *)currentPlayer {
    Player *currentPlayer = players[currentPlayerIndex];
    return currentPlayer.name;
}

@end
