//
//  LightEffectModel.m
//  OpenGLESShader
//
//  Created by 黄世平 on 2021/9/5.
//  Copyright © 2021 huangshiping. All rights reserved.
//

#import "LightEffectModel.h"
#import <UIKit/UIKit.h>
#import "HGLUtils.h"

@implementation LightEffectModel
{
    GLuint          _program;
    GLuint          _vbo;
    GLuint          _texture;
    int             _vertCount;
    NSArray*        _images;
}

-(instancetype)init {
    if (self = [super init]) {
        [self setupGL];
        _images = @[@"timg.jpg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    }
    return self;
}

-(void)setupGL
{
    
    _program = [HGLUtils compileShaders:H_Light_VERTEX shaderFragment:H_Light_FRAGMENT];
    GLfloat vertices[] = {
        -1.f, -1.f, 0.0f,  0.0f, 1.0f,  // 左下
        1.f, -1.f, 0.0f,   1.0f, 1.0f,  // 右下
        -1.f,  1.f, 0.0f,  0.0f, 0.0f,  // 左上
        1.f,  1.f, 0.0f,   1.0f, 0.0f,  // 右上
        
    };
    
    glUseProgram(_program);
    glGenBuffers(1, &_vbo);
    glBindBuffer(GL_ARRAY_BUFFER, _vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
}

static int curIndex = 0;
-(void)draw {
    static float globalTime = 0.0f;
    glUseProgram(_program);
    
    UIImage* image = [UIImage imageNamed:_images[curIndex++ % 6]];
    _texture = [HGLUtils createTextureWithImage:image];
    
    glEnableVertexAttribArray(glGetAttribLocation(_program, "aPosition"));
    glVertexAttribPointer(glGetAttribLocation(_program, "aPosition"), 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, NULL);
    
    glEnableVertexAttribArray(glGetAttribLocation(_program, "aTexCoord"));
    glVertexAttribPointer(glGetAttribLocation(_program, "aTexCoord"), 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, NULL+sizeof(GL_FLOAT)*3);
       
    
    // 激活纹理
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, _texture);
    glUniform1i(glGetUniformLocation(_program, "uSampler"), 0);
    
    globalTime += 0.1f;
    glUniform1f(glGetUniformLocation(_program,"uTime"), globalTime);
    
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
}

-(void)dealloc {
    
    glDeleteBuffers(1, &_vbo);
    glDeleteTextures(1, &_texture);
    glDeleteProgram(_program);
    
}

@end
