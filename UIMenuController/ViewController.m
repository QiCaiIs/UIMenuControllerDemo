//
//  ViewController.m
//  UIMenuController
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 奇才. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>

@interface ViewController ()
@property(nonatomic,strong) UIMenuController * menuController;
@end

@implementation ViewController
{
    UIImageView *bigView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    bigView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 300)];
    
    NSString *name = @"2.gif";
    NSString *paa = [[NSBundle mainBundle]bundlePath];
    NSString *filePath = [[NSBundle bundleWithPath:paa]pathForResource:name ofType:nil];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
//    bigView.image = [UIImage sd_animatedGIFWithData:imageData];
    bigView.image = [UIImage imageNamed:@"1.jpg"];
    bigView.userInteractionEnabled = YES;
    bigView.layer.cornerRadius = 15;
    bigView.clipsToBounds = YES;
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTouch:)];
    recognizer.minimumPressDuration = 1;
    recognizer.allowableMovement = 30;
    
    [bigView addGestureRecognizer:recognizer];
    
    [self.view addSubview:bigView];
    
    
    
    
}

- (void)longTouch:(UILongPressGestureRecognizer *)touch{
    NSLog(@"`~~~~");

    CATransition *ani4 = [CATransition animation];
    ani4.duration = 1;
    //一堆字符串
    ani4.type = @"rippleEffect";
     ani4.duration = 3.0f;
    [bigView.layer addAnimation:ani4 forKey:nil];
    
    if (touch.state == UIGestureRecognizerStateBegan) {
        [self.view becomeFirstResponder];
    
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        //复制
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(buttonAction:)];
        
        //收藏
        UIMenuItem *collectItem = [[UIMenuItem alloc] initWithTitle:@"收藏" action:@selector(buttonAction:)];
        
        //举报
        UIMenuItem *reportItem = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(buttonAction:)];
        
        menu.menuItems = @[copyItem,collectItem,reportItem];
        
        [menu setMenuVisible:YES animated:YES];
        
        [menu setTargetRect:bigView.frame inView:self.view];
    }
    if (touch.state == UIGestureRecognizerStateEnded) {
      
    }

}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)buttonAction:(UIButton *)button{
    NSLog(@"111");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
