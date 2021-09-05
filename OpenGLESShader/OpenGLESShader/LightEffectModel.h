//
//  LightEffectModel.h
//  OpenGLESShader
//
//  Created by 黄世平 on 2021/9/5.
//  Copyright © 2021 huangshiping. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GLKit/GLKit.h>

NS_ASSUME_NONNULL_BEGIN

#define H_Light_VERTEX [[NSBundle mainBundle] pathForResource:@"lightShader" ofType:@"vsh"]
#define H_Light_FRAGMENT [[NSBundle mainBundle] pathForResource:@"lightShader" ofType:@"fsh"]


@interface LightEffectModel : NSObject

-(instancetype)init;

-(void)draw;

@end

NS_ASSUME_NONNULL_END
