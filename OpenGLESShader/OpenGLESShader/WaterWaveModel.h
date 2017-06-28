//
//  WaterWaveModel.h
//  OpenGLESShader
//
//  Created by huangshiping on 2017/6/27.
//  Copyright © 2017年 huangshiping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define H_WaterWave_VERTEX [[NSBundle mainBundle] pathForResource:@"waterShader" ofType:@"vsh"]
#define H_WaterWave_FRAGMENT [[NSBundle mainBundle] pathForResource:@"waterShader" ofType:@"fsh"]


@interface WaterWaveModel : NSObject

-(instancetype)initWithImage:(UIImage*)image;

-(void)draw;
@end
