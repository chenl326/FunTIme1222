//
//  CLSquareButton.m
//  轻松一刻
//
//  Created by chenl on 16/5/22.
//  Copyright © 2016年 chenl. All rights reserved.
//

#import "CLSquareButton.h"
#import "CLSquareModel.h"
//button设置图片
#import <UIButton+WebCache.h>
@implementation CLSquareButton

-(void)setup{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib
{
    [self setup];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    // 调整图片
    self.imageView.y = self.height * 0.15;
    self.imageView.width = self.width * 0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.centerX = self.width * 0.5;
    // 调整文字
    self.titleLabel.x = 0;
//    y值等于图片的最大y值
     self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}
-(void)setSquare:(CLSquareModel *)square{
    _square = square;
    [self setTitle:square.name forState:(UIControlStateNormal)];
    // 利用SDWebImage给按钮设置image

    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:(UIControlStateNormal)];
}
@end
