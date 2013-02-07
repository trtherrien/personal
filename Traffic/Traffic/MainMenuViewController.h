//
//  DataViewController.h
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MainMenuViewController : UIViewController
{
    CAKeyframeAnimation* popAnimation;
}

@property (weak, nonatomic) IBOutlet UIButton *gameButton;
@property (weak, nonatomic) IBOutlet UIButton *statButton;
@property (weak, nonatomic) IBOutlet UIButton *gameSettingsButton;


@end
