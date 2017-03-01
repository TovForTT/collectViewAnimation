//
//  ViewController.m
//  TestPhotoAnimation
//
//  Created by Tov_ on 17/3/1.
//  Copyright © 2017年 TTT. All rights reserved.
//

#import "ViewController.h"
#import "MyFlowLayout.h"
#import "MyCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyFlowLayout *fl = [[MyFlowLayout alloc] init];
    fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    fl.itemSize = CGSizeMake(self.view.bounds.size.width / 2, self.view.bounds.size.width / 2 + 100);
    fl.sectionInset = UIEdgeInsetsMake(0, self.view.bounds.size.width / 4, 0, self.view.bounds.size.width / 4);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 200) collectionViewLayout:fl];
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.heroImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", indexPath.row]];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
