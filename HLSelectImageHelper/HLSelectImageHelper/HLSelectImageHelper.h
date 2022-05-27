//
//  HLSelectImageHelper.h
//  HLSelectImageHelper
//
//  Created by HL_iOS on 2022/5/27.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HLSelectImageType) {
    HLSelectImageTypeAvatar,    // 头像
    HLSelectImageTypeIDCard,    // 身份证
};

@interface HLSelectImageHelper : NSObject

/**
 *  选择多张照片
 *  maxImagesCount 最大数量
 *  allowTakePicture 是否能拍摄照片
 *  allowCrop 是否剪裁
 */
+ (void)selectImages:(NSInteger)maxImagesCount
    allowTakePicture:(BOOL)allowTakePicture
           allowCrop:(BOOL)allowCrop
              fromVc:(UIViewController *)fromVc
               block:(void(^)(NSArray<UIImage *> *images))block;

/**
 *  选择并剪裁
 */
+ (void)selectCropImage:(HLSelectImageType)type
                 fromVc:(UIViewController *)fromVc
                  block:(void(^)(UIImage *image))block;

@end
