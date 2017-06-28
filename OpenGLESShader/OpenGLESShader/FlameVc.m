//
//  FlameVc.m
//  OpenGLESShader
//
//  Created by huangshiping on 2017/6/27.
//  Copyright © 2017年 huangshiping. All rights reserved.
//

#import "FlameVc.h"
#import "FlameModel.h"

@interface FlameVc ()

@property (nonatomic, strong) EAGLContext *context;

@property(nonatomic,strong)FlameModel* flameModel;
@end

@implementation FlameVc

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
    
    
    self.flameModel = [[FlameModel alloc] init];
    
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    GLfloat scale = [UIScreen mainScreen].scale;
    glViewport(0, 0, self.view.frame.size.width * scale, self.view.frame.size.height * scale);
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.flameModel draw];
}


@end
