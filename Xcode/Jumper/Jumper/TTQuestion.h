//
//  TTQuestion.h
//  Jumper
//
//  Created by Thomas Therrien on 9/29/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTQuestion : NSObject 

@property (readonly, nonatomic) int topNumber;
@property (readonly, nonatomic) int bottomNumber;
@property (readonly, nonatomic) int answer;
@property (readonly, nonatomic) int wrongAnswer1;
@property (readonly, nonatomic) int wrongAnswer2;
@property (readonly, nonatomic) int correctLocation;

typedef enum {
    QUESTION_ADD,
    QUESTION_SUB,
    QUESTION_MUL,
    QUESTION_DIV
}QuestionType;

@property (readonly, nonatomic) QuestionType qType;
extern const int MAX_NUMBER;

-(void) generateQuestion :(QuestionType) qType;

@end
