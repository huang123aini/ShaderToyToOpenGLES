//
//  ShadowEffectModel.h
//  OpenGLESShader
//
//  Created by 黄世平 on 2021/9/4.
//  Copyright © 2021 huangshiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

NS_ASSUME_NONNULL_BEGIN

#define H_Shadow_VERTEX [[NSBundle mainBundle] pathForResource:@"shadowShader" ofType:@"vsh"]
#define H_Shadow_FRAGMENT [[NSBundle mainBundle] pathForResource:@"shadowShader" ofType:@"fsh"]


@interface ShadowEffectModel : NSObject

-(instancetype)init;

-(void)draw;

@end

NS_ASSUME_NONNULL_END
