//
//  ViewController.m
//  HLSelectImageHelper
//
//  Created by JJB_iOS on 2022/5/27.
//

#import "ViewController.h"
#import "HLSelectImageHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Response Event

- (IBAction)actions:(UIButton *)sender {
    // 选择5张照片
    if (sender.tag == 0) {
        [HLSelectImageHelper selectImages:5
                         allowTakePicture:YES
                                allowCrop:NO
                                   fromVc:self
                                    block:^(NSArray<UIImage *> *images) {
            NSLog(@"%@", images);
        }];
    }
    // 选择头像
    else if (sender.tag == 1) {
        [HLSelectImageHelper selectCropImage:HLSelectImageTypeAvatar
                                      fromVc:self
                                       block:^(UIImage *image) {
            NSLog(@"%@", image);
        }];
    }
    // 选择身份证
    else {
        [HLSelectImageHelper selectCropImage:HLSelectImageTypeIDCard
                                      fromVc:self
                                       block:^(UIImage *image) {
            NSLog(@"%@", image);
        }];
    }
}

@end
