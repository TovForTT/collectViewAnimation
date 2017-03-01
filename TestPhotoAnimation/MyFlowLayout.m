//
//  MyFlowLayout.m
//  TestPhotoAnimation
//
//  Created by Tov_ on 17/3/1.
//  Copyright © 2017年 TTT. All rights reserved.
//

#import "MyFlowLayout.h"

@implementation MyFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
}


- (CGSize)collectionViewContentSize {
    return [super collectionViewContentSize];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGRect showR = CGRectMake(self.collectionView.contentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray *showItems = [super layoutAttributesForElementsInRect:showR];
    
    for (UICollectionViewLayoutAttributes *att in showItems) {
        CGFloat half = self.collectionView.bounds.size.width / 2;
        CGFloat dis = att.center.x - self.collectionView.contentOffset.x;
        BOOL flag = dis - half > 0;
        CGFloat faboffset = fabs(dis - half);
        CGFloat scale = 1 - faboffset / half;
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -2000;
        transform = CATransform3DScale(transform, 0.7 + scale * 0.4, 0.7 + scale * 0.4, 1);
        
        if (flag) {
            if (faboffset > 100) {
                transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
            } else {
                transform = CATransform3DRotate(transform, M_PI_4 - (M_PI_4 * (100 - faboffset) / 100), 0, 1, 0);
            }
        } else {
            if (faboffset > 100) {
                transform = CATransform3DRotate(transform, - M_PI_4, 0, 1, 0);
            } else {
                transform = CATransform3DRotate(transform, - M_PI_4 + (M_PI_4 * (100 - faboffset) / 100), 0, 1, 0);
            }
        }
        
        
        
        att.transform3D = transform;
        
    }
    
    return [[NSArray alloc] initWithArray:showItems copyItems:YES];
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
