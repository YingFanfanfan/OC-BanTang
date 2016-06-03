//
//  BTMessageViewController.m
//  OCBanTang
//
//  Created by 颖帆帆帆 on 16/5/30.
//  Copyright © 2016年 颖帆帆帆. All rights reserved.
//

#import "BTMessageViewController.h"
#import "BTLikeViewController.h"
#import "BTCommentViewController.h"
#import "BTNotifyViewController.h"

@interface BTMessageViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak) UIView *titleView;
@property(nonatomic, weak) UIScrollView *contentView;
@property(nonatomic, strong) UIView *redView;

// 记录上一个按钮
@property (nonatomic, weak) UIButton *selectedBtn;
// 记录所有按钮
@property (nonatomic, strong) NSMutableArray *titleBtns;

@end

@implementation BTMessageViewController



- (NSMutableArray *)titleBtns {
    if (_titleBtns == nil) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
    
    // 1.设置标题View
    [self setupTitleView];
    
    // 2.设置内容View
    [self setupContentView];
    
    // 3.添加所有子控制器
    [self setupAllChildViewController];
    
    // 4.设置标题
    [self setAllTitle];
    
    
    
    // 设置自动滚动区域为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


// 设置标题
- (void)setAllTitle {
    // 遍历所有子控制器
    NSInteger count = self.childViewControllers.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = HYFScreenW / count;
    CGFloat h = 44;
    for (int i = 0; i < count; i++) {
        // 获取对应的子控制器
        UIViewController *vc = self.childViewControllers[i];
        // 自定义按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮字体颜色
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        // 设置按钮字体大小
        btn.titleLabel.font = [UIFont systemFontOfSize: 15];
        
        // 设置按钮标题
        [btn setTitle:vc.title forState:UIControlStateNormal];
        // 设置按钮尺寸
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        
        // 给按钮设置tag
        btn.tag = i;
        
        // 添加btn
        [self.titleView addSubview:btn];
        
        [self.titleBtns addObject:btn];
        
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 默认选中第0个
        if (i == 0) {
            [self btnClick:btn];
            
        }
    }
    
    [self setupRedView];
    
    
    // 设置内容滚动区域
    _contentView.contentSize = CGSizeMake(count * HYFScreenW, 0);
    // 不显示滚动条
    _contentView.showsVerticalScrollIndicator = NO;
    // 开启分页功能
    _contentView.pagingEnabled = YES;
    
}

// 添加子控制器
- (void)addChildView:(NSInteger)i {
    
    UIViewController *vc = self.childViewControllers[i];
    CGFloat x = HYFScreenW * i ;
    // 设置尺寸
    vc.view.frame = CGRectMake(x, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
    // 添加
    [self.contentView addSubview:vc.view];
    
}

// 点击按钮
- (void)btnClick:(UIButton *)button {
    
    NSInteger i = button.tag;
    
    [UIView animateWithDuration:0.25 animations:^{
        _redView.hyf_center_x = button.hyf_center_x;
    }];
   
    
    // 2.添加对应的子控制器
    [self addChildView:i];
    
    // 3.滚动到相应的控制器
    CGFloat x = HYFScreenW * i ;
    _contentView.contentOffset = CGPointMake(x, 0);
    
}

#pragma mark - UIScrollViewDelegate
// 滚动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"%f", scrollView.contentOffset.x);
    
    CGFloat w = HYFScreenW / 3;
    
    CGFloat x = w * scrollView.contentOffset.x / HYFScreenW;
    
    _redView.hyf_center_x = x + w * 0.5;
    
}

// 滚动完成调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 确定当前在第几页
    NSInteger page = scrollView.contentOffset.x / HYFScreenW;
    
    // 1.添加对应的控制器
    [self addChildView:page];
    
    
}



#pragma mark - 添加所以子控制器
- (void)setupAllChildViewController {
    
    // 喜欢
    BTLikeViewController *likeVC = [[BTLikeViewController alloc] init];
    likeVC.view.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
    likeVC.title = @"喜欢/收藏";
    [self addChildViewController:likeVC];
    
    // 评论
    BTCommentViewController *commentVC = [[BTCommentViewController alloc] init];
    commentVC.view.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
    commentVC.title = @"评论";
    [self addChildViewController:commentVC];
    
    // 通知
    BTNotifyViewController *notifytVC = [[BTNotifyViewController alloc] init];
    notifytVC.view.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
    notifytVC.title = @"通知";
    [self addChildViewController:notifytVC];
    
}

- (void)setupRedView {
    // 添加红色view
    
    CGFloat count = 47;
    
    //    CGFloat x = 0;
    CGFloat w = 30;
    CGFloat h = 4;
    
    CGRect rect = CGRectMake(count, _titleView.hyf_h - h, w, h);
    
    UIView *redView = [[UIView alloc] initWithFrame:rect];
    
    _redView = redView;
    
    redView.backgroundColor = [UIColor redColor];
    
    [self.titleView addSubview:redView];
}


#pragma mark - 设置内容View
- (void)setupContentView
{
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
//    contentView.backgroundColor = [UIColor redColor];
    CGFloat y = CGRectGetMaxY(_titleView.frame);
    contentView.frame = CGRectMake(0, y, HYFScreenW, HYFScreenH - y);
    _contentView = contentView;
    _contentView.delegate = self;
    [self.view addSubview:contentView];
    
}



#pragma mark - 设置标题View
- (void)setupTitleView {
    
    UIView *titleView = [[UIView alloc] init];
    
    CGFloat y = self.navigationController.navigationBarHidden ? 20.3 : 64.3;
    
    titleView.frame = CGRectMake(0, y, HYFScreenW, 44);
    
    titleView.backgroundColor = [UIColor whiteColor];
    
    _titleView = titleView;
    
    [self.view addSubview:titleView];
    
}


@end
