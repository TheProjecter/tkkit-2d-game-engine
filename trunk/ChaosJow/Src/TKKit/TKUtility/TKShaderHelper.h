//
//  ShaderHelper.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-3.
//

#import <Foundation/Foundation.h>

@interface TKShaderHelper : NSObject

+ (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file;
+ (BOOL)linkProgram:(GLuint)prog;
+ (BOOL)validateProgram:(GLuint)prog;

@end
