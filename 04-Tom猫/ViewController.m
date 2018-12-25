//
//  ViewController.m
//  04-Tom猫
//
//  Created by lishan on 2018/12/6.
//  Copyright © 2018年 lishan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Tom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)AnimationWithName:(NSString*)name count:(NSInteger)count{
    if(self.Tom.animating)return;
        
    NSMutableArray *arrayM=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSString *imageName=[NSString stringWithFormat:@"%@_%02d.jpg", name, i];
//        UIImage *image=[UIImage imageNamed:imageName];
        NSString *path=[[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image=[UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
    }
    

    
    //设置动画数组
    self.Tom.animationImages=arrayM;
    //动画时长
    self.Tom.animationDuration=self.Tom.animationImages.count*0.075;
    //设置重复次数
    self.Tom.animationRepeatCount=1;
    //开始动画
    [self.Tom startAnimating];
    
    //动画结束后清理动画数组
//    [self.Tom performSelector:@selector(cleanup:) withObject:nil afterDelay:self.Tom.animationDuration];
    [self.Tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.Tom.animationDuration];
}

//- (void)cleanup
//{
//    NSLog(@"%s", __func__);
////    self.tom.animationImages = nil;
//    [self.tom setAnimationImages:nil];
//}

- (IBAction)TomAction:(UIButton *)button {
    
    [self AnimationWithName:button.currentTitle count:button.tag];
    
}


@end
