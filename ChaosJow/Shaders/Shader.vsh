//
//  Shader.vsh
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-3.
//

attribute vec4 position;
attribute vec2 texcoord;

uniform mat4 mvpMatrix;

varying lowp vec2 varyingTexcoord;

void main()
{
    varyingTexcoord = texcoord;
    gl_Position = mvpMatrix * position;
}
