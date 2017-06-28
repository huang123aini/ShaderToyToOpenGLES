//
//  HGLUtils.h
//  HTools
//
//  Created by huangshiping on 2017/6/1.
//  Copyright © 2017年 huangshiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <UIKit/UIKit.h>




@interface HGLUtils : NSObject

/**
 *@编译生成Program
 */
+ (GLuint)compileShaders:(NSString *)shaderVertex shaderFragment:(NSString *)shaderFragment;


/**
 *@生成VBO
 */
+(GLuint)createVBO:(GLenum)target usage:(int)usage dataSize:(int)dataSize data:(void*)data;

/**
 *@通过Image生成TextureID
 */
+(GLuint)createTextureWithImage:(UIImage*)image;


@end
