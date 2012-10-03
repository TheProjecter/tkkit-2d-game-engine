//
//  Shader.fsh
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-3.
//

varying lowp vec2 varyingTexcoord;

uniform lowp float alpha;
uniform sampler2D texture0;

void main()
{
    gl_FragColor = texture2D(texture0, varyingTexcoord)*alpha;
}
