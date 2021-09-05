//
//  LightEffectVc.m
//  OpenGLESShader
//
//  Created by 黄世平 on 2021/9/5.
//  Copyright © 2021 huangshiping. All rights reserved.
//

#import "LightEffectVc.h"
#import "LightEffectModel.h"

@interface LightEffectVc ()

@property (nonatomic, strong) EAGLContext *context;

@property(nonatomic,strong)LightEffectModel* lightEffectModel;

@end

@implementation LightEffectVc

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
    

    self.lightEffectModel = [[LightEffectModel alloc] init];
    
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    GLfloat scale = [UIScreen mainScreen].scale;
    glViewport(0, 0, self.view.frame.size.width * scale, self.view.frame.size.height * scale);
    glClearColor(0.f, 0.f, 0.f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.lightEffectModel draw];
}
@end

