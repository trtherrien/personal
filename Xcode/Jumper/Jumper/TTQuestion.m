//
//  TTQuestion.m
//  Jumper
//
//  Created by Thomas Therrien on 9/29/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "TTQuestion.h"

@implementation TTQuestion

const int MAX_NUMBER = 12;

-(void) generateQuestion :(QuestionType) qType{
    _topNumber = (arc4random()%MAX_NUMBER + 1); //Generates Number from 0 to MAX_NUMBER.
    _correctLocation = (arc4random()%3) + 1;
    _qType = qType;
    
    if (_qType == QUESTION_DIV) {
        _bottomNumber = (arc4random()%_topNumber) + 1; //Generates Number from 1 to top_Number.
    } else {
        _bottomNumber = (arc4random()%MAX_NUMBER + 1); //Generates Number from 0 to MAX_NUMBER.
    }
    
    switch (_qType) {
        case QUESTION_ADD:
            _answer = _topNumber + _bottomNumber;
            _wrongAnswer1 = _answer + (arc4random()%10) + 1;
            _wrongAnswer2 = _answer + (arc4random()%10) + 1;
            while (_wrongAnswer1 == _wrongAnswer2) {
                _wrongAnswer2 = _answer + (arc4random()%10) + 1;
            }
            break;
        case QUESTION_SUB:
            _bottomNumber = (arc4random()%_topNumber + 1);
            _answer = _topNumber - _bottomNumber;
            _wrongAnswer1 = _topNumber - (arc4random()%_topNumber + 1);
            while (_wrongAnswer1 == _bottomNumber)
            {
                _wrongAnswer1 = _topNumber - (arc4random()%_topNumber + 1);
            }
            _wrongAnswer2 = _topNumber - (arc4random()%_topNumber + 1);
            while (_wrongAnswer2 == _bottomNumber || _wrongAnswer1 == _wrongAnswer2)
            {
                _wrongAnswer2 = _topNumber - (arc4random()%_topNumber + 1);
            }
            break;
        case QUESTION_MUL:
            _answer = _topNumber * _bottomNumber;
            _wrongAnswer1 = _topNumber * (arc4random()%MAX_NUMBER + 1);
            while (_wrongAnswer1 == _answer) {
                _wrongAnswer1 = _topNumber * (arc4random()%MAX_NUMBER + 1);
            }
            
            _wrongAnswer2 = _topNumber * (arc4random()%MAX_NUMBER + 1);
            while (_wrongAnswer1 == _wrongAnswer2 ||  _wrongAnswer2 == _answer) {
                _wrongAnswer2 = _topNumber * (arc4random()%MAX_NUMBER + 1);
            }
            break;
        case QUESTION_DIV:
            _answer = 0;
            _wrongAnswer1 = 1;
            _wrongAnswer2 = 2;
            break;
    }
    
}

@end
