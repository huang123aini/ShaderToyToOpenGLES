/* 
  shadowShader.vsh
  OpenGLESShader

  Created by 黄世平 on 2021/9/4.
  Copyright © 2021 huangshiping. All rights reserved.
*/

attribute vec3 aPosition;
attribute vec2 aTexCoord;

varying   vec2 vTexCoord;
void main()
{
    gl_Position = vec4(aPosition,1.0);

    vTexCoord = aTexCoord.xy;
}

