//
//  ViewController.m
//  ZYCycleScrollView_OC
//
//  Created by sogubaby on 2019/1/16.
//  Copyright © 2019 sogubaby. All rights reserved.
//

#import "ViewController.h"
#import "ZYCycleScrollView.h"

@interface ViewController ()<ZYCycleScrollViewDelegate>

@property (nonatomic, strong) ZYCycleScrollView *cycleView;

@property (nonatomic, strong) NSArray *imageUrls;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.cycleView];
    self.imageUrls = @[@"http://wx4.sinaimg.cn/large/a1b61d0aly1fn2h3xwat6j20dw0dwtbp.jpg",@"http://pic1.nipic.com/2008-10-08/20081081110253_2.jpg",@"http://wx3.sinaimg.cn/large/006nLajtly1fpi9ikmj1kj30dw0dwwfq.jpg"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cycleView reloadData];
}

#pragma mark ZYCycleScrollViewDelegate

- (NSInteger)zy_numberOfPage {
    return self.imageUrls.count;
}

- (nonnull id)zy_cycleScrollView:(nonnull ZYCycleScrollView *)cycleScrollView imageDataForItemAtIndex:(NSInteger)index {
    return self.imageUrls[index];
}

- (ZYCycleScrollView *)cycleView {
    if (_cycleView == nil) {
        _cycleView = [[ZYCycleScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
        _cycleView.autoScroll = true;
        _cycleView.autoScrollTimeInterval = 5.0;
        _cycleView.hidePageControl = false;
        _cycleView.delegate = self;
    }
    return _cycleView;
}

- (void)dealloc {
    NSLog(@"----- %s ---- ",__func__);
}



@end

