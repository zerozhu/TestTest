//
//  WBMeasuringView.m
//  WristBand
//
//  Created by zhuzhi on 14/11/4.
//  Copyright (c) 2014年 WB. All rights reserved.
//

#import "WBMeasuringView.h"

@interface WBMeasuringView ()
{
    UIView *alarmView;
    UILabel *alarmoffLabel;
    UIView *backView;
    UILabel *measuringLabel;
    UIImageView *animationView;
    CABasicAnimation *rotationAnimation;
    
    NSLayoutConstraint *backViewTopConstraint;
}

@end

@implementation WBMeasuringView

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
    if (self) {
        self.backgroundColor = RGB(33,39,40);
        
        alarmView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, 173.0f)];
        alarmView.backgroundColor = [UIColor clearColor];
        [self addSubview:alarmView];
        
        alarmoffLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 43.0f, 200.0f, 16.0f)];
        alarmoffLabel.textAlignment = NSTextAlignmentLeft;
        alarmoffLabel.backgroundColor = [UIColor clearColor];
        alarmoffLabel.textColor = [UIColor whiteColor];
        alarmoffLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        alarmoffLabel.text = NSLocalizedString(@"ALARM OFF", nil);
        [alarmView addSubview:alarmoffLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 173.0f, IPHONE_WIDTH, 0.5f)];
        lineView.backgroundColor = [UIColor whiteColor];
        [alarmView addSubview:lineView];
        
        backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor clearColor];
        [self addSubview:backView];
        backViewTopConstraint = [backView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:lineView.bottom];
        [backView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [backView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [backView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_measuring_spinner"]];
        [backView addSubview:animationView];
        [animationView autoCenterInSuperview];
        
        measuringLabel = [[UILabel alloc] init];
        measuringLabel.textAlignment = NSTextAlignmentCenter;
        measuringLabel.backgroundColor = [UIColor clearColor];
        measuringLabel.textColor = RGB(149,164,165);
        measuringLabel.font = [UIFont boldSystemFontOfSize:17.0f];
        measuringLabel.text = NSLocalizedString(@"Measuring", nil);
        [backView addSubview:measuringLabel];
        [measuringLabel autoCenterInSuperview];
        
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
        rotationAnimation.duration = 3.5f;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = HUGE_VALF;
        
        UIButton *stopMeasuringButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [stopMeasuringButton addTarget:self action:@selector(stopMeasuringButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [stopMeasuringButton setTitleColor:RGB(149,164,165) forState:UIControlStateNormal];
        stopMeasuringButton.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        [stopMeasuringButton setBackgroundImage:[UIImage imageNamed:@"button_background_image_night"] forState:UIControlStateNormal];
        [stopMeasuringButton setTitle:NSLocalizedString(@"Stop measuring", nil) forState:UIControlStateNormal];
        [backView addSubview:stopMeasuringButton];
        [stopMeasuringButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [stopMeasuringButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [stopMeasuringButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [stopMeasuringButton autoSetDimension:ALDimensionHeight toSize:43.0f];
        
        [self startAnimation];
    }
    
    
    return self;
    
}

- (void)startAnimation {
    [animationView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation {
    [animationView.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)stopMeasuringButtonClick {
    alarmView.hidden = YES;
    measuringLabel.text = NSLocalizedString(@"Analyzing", nil);
    backViewTopConstraint.constant = 0.0f;
    
    [self updateConstraintsIfNeeded];
}

@end