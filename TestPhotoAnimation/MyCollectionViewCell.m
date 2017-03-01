//
//  MyCollectionViewCell.m
//  TestPhotoAnimation
//
//  Created by Tov_ on 17/3/1.
//  Copyright © 2017年 TTT. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
   
    self.heroImageV.layer.cornerRadius = 10;
    self.heroImageV.layer.masksToBounds = YES;
    
    self.bgView.clipsToBounds = NO;
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(2, 2);
    self.bgView.layer.shadowRadius = 5;
    self.bgView.layer.shadowOpacity = 0.7;
    self.bgView.clipsToBounds = NO;
}

@end
