# HLSelectImageHelper
对TZImagePickerController简单封装

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLSelectImageHelper', '1.0.1'
```

基本使用方法:<p>

``` objc
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
```
    
> 注意在Info.plist中添加`Privacy - Camera Usage Description`和`Privacy - Photo Library Usage Description`（访问相机、相册）权限说明

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version
    
* 1.0.1 :

  修改描述文件
    
* 1.0.0 :

  完成HLSelectImageHelper基础搭建

# License
HLSelectImageHelper is available under the MIT license. See the LICENSE file for more info.
