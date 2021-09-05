//
//  ShadowEffectVc.m
//  OpenGLESShader
//
//  Created by 黄世平 on 2021/9/4.
//  Copyright © 2021 huangshiping. All rights reserved.
//

#import "ShadowEffectVc.h"
#import "ShadowEffectModel.h"

@interface ShadowEffectVc ()

@property (nonatomic, strong) EAGLContext *context;

@property(nonatomic,strong)ShadowEffectModel* shadowEffectModel;
@end

@implementation ShadowEffectVc

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context)
    {
        NSLog(@"Failed to create ES context");
    }
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    self.preferredFramesPerSecond = 60;

    [EAGLContext setCurrentContext:self.context];
    

    self.shadowEffectModel = [[ShadowEffectModel alloc] init];
    
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    GLfloat scale = [UIScreen mainScreen].scale;
    glViewport(0, 0, self.view.frame.size.width * scale, self.view.frame.size.height * scale);
    glClearColor(0.f, 0.f, 0.f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.shadowEffectModel draw];
}
@end
