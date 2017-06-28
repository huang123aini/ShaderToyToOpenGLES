

#import "FlameModel.h"
#import <GLKit/GLKit.h>
#import "HGLUtils.h"


@interface FlameModel()
{
    GLuint          _program;
    GLuint          _vbo;
}

@end

@implementation FlameModel

-(instancetype)init
{
    if (self = [super init])
    {
        [self setupGL];
    }
    return self;
}

-(void)setupGL
{
    
    _program = [HGLUtils compileShaders:H_Flame_VERTEX shaderFragment:H_Flame_FRAGMENT];
    
    GLfloat vertices[] =
    {
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

-(void)draw
{
    static float globalTime = 0.0f;
    
    glUseProgram(_program);
    
    glEnableVertexAttribArray(glGetAttribLocation(_program, "aPosition"));
    glVertexAttribPointer(glGetAttribLocation(_program, "aPosition"), 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, NULL);
    
    glEnableVertexAttribArray(glGetAttribLocation(_program, "aTexCoord"));
    glVertexAttribPointer(glGetAttribLocation(_program, "aTexCoord"), 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, NULL+sizeof(GL_FLOAT)*3);
    

    globalTime += 0.3f;
    glUniform1f(glGetUniformLocation(_program,"uTime"), globalTime);
    
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

-(void)dealloc
{
    
    glDeleteBuffers(1, &_vbo);
    glDeleteProgram(_program);
    
}
@end
