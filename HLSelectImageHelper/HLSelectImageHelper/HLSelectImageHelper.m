//
//  HLSelectImageHelper.m
//  HLSelectImageHelper
//
//  Created by HL_iOS on 2022/5/27.
//

#define kHLScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kHLScreenWidth    [UIScreen mainScreen].bounds.size.width

#import "HLSelectImageHelper.h"
#import <TZImagePickerController/TZImagePickerController.h>

@implementation HLSelectImageHelper

+ (void)selectImages:(NSInteger)maxImagesCount
    allowTakePicture:(BOOL)allowTakePicture
           allowCrop:(BOOL)allowCrop
              fromVc:(UIViewController *)fromVc
               block:(void(^)(NSArray<UIImage *> *images))block
{
    TZImagePickerController *vc = [TZImagePickerController new];
    vc.allowCameraLocation = NO;
    vc.maxImagesCount = maxImagesCount;
    vc.allowTakePicture = allowTakePicture;
    vc.allowCrop = allowCrop;
    vc.allowPickingVideo = NO;
    vc.showPhotoCannotSelectLayer = YES;
    [vc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (block) {
            block(photos);
        }
    }];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [fromVc presentViewController:vc animated:YES completion:^{}];
}

/**
 *  选择并剪裁
 */
+ (void)selectCropImage:(HLSelectImageType)type
                 fromVc:(UIViewController *)fromVc
                  block:(void(^)(UIImage *image))block
{
    TZImagePickerController *vc = [TZImagePickerController new];
    vc.allowCameraLocation = NO;
    vc.maxImagesCount = 1;
    vc.allowCrop = YES;
    vc.showSelectBtn = NO;
    vc.allowPickingVideo = NO;
    vc.showPhotoCannotSelectLayer = YES;
    
    if (type == HLSelectImageTypeIDCard) {
        CGFloat pWidth = kHLScreenWidth;
        CGFloat pHeight = pWidth/85.6*54;
        vc.cropRect = CGRectMake(0, (kHLScreenHeight-pHeight)/2.0f, pWidth, pHeight);
    }
    
    [vc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (block) {
            block(photos.firstObject);
        }
    }];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [fromVc presentViewController:vc animated:YES completion:^{}];
}

@end
