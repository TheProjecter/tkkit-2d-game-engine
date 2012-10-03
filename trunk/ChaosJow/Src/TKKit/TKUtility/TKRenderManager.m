//
//  TKRenderManager.m
//  ChaosJow
//
//

#import "TKRenderManager.h"
#import "TKSpriteNode.h"
#import "TKSprite.h"
#import "TKTexture.h"
#import "TKLayer.h"
#import "TKUtility.h"
#import "TKDirector.h"
#import "TKShaderHelper.h"
#import "TKDynamicBuffer.h"

//#define USE_VERTEX_BUFFER

@interface TKRenderManager ()
{
    NSInteger frameCount;
    NSTimeInterval accumTime;
    
#ifdef USE_VERTEX_BUFFER
    NSInteger bufferSize;
    NSInteger spriteCount;
    GLbyte* vertexData;
    GLbyte* texCoordData;
    GLfloat* alphaData;
    GLuint*  textureNameData;
#endif
}
@property (strong, nonatomic) UILabel* labelFPS;

@end

enum{
    TKVertexAttribPosition,
    TKVertexAttribTexCoord,
    TKVertexAttribAlpha
};

@implementation TKRenderManager

@synthesize mainViewController;
@synthesize director;
@synthesize program;
@synthesize mvpMatrixUniformLocation;
@synthesize alphaUniformLocation;
@synthesize sampleUniformLocation;
@synthesize projectMatrix;
@synthesize labelFPS;

#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector
{
    if (self = [super init])
    {
        director = mainDirector;
#ifdef USE_VERTEX_BUFFER
        bufferSize = 1024;
        spriteCount = 0;
        vertexData = malloc(bufferSize*4);
        texCoordData = malloc(bufferSize*2);
        alphaData = malloc(bufferSize*1);
        textureNameData = malloc(bufferSize*1);
#endif
        
        [self loadShaders];
        [self setupRenderParameter];
    }
    
    return self;
}

- (void)loadShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    self.program = glCreateProgram();
    
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shader" ofType:@"vsh"];
    if (![TKShaderHelper compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return ;
    }
    
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shader" ofType:@"fsh"];
    if (![TKShaderHelper compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader");
        return ;
    }
    
    glAttachShader(self.program, vertShader);
    glAttachShader(self.program, fragShader);
    
    glBindAttribLocation(self.program, TKVertexAttribPosition, "position");
    glBindAttribLocation(self.program, TKVertexAttribTexCoord, "texcoord");
    
    glEnableVertexAttribArray(TKVertexAttribPosition);
    glEnableVertexAttribArray(TKVertexAttribTexCoord);
    
    if (![TKShaderHelper linkProgram:self.program]) 
    {
        NSLog(@"Failed to link program: %d", self.program);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (self.program) {
            glDeleteProgram(self.program);
            self.program = 0;
        }
        
        return ;
    }
    
    mvpMatrixUniformLocation = glGetUniformLocation(self.program, "mvpMatrix");
    alphaUniformLocation     = glGetUniformLocation(self.program, "alpha");
    sampleUniformLocation    = glGetUniformLocation(self.program, "texture0");
    
    if (vertShader) {
        glDetachShader(self.program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(self.program, fragShader);
        glDeleteShader(fragShader);
    }
}

- (void)setupRenderParameter
{
    frameCount = 0;
    accumTime = 0;

    glEnable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
    glDisable(GL_DEPTH_TEST);

    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glClearColor(0, 0, 0, 1.0);
    
    projectMatrix = GLKMatrix4MakeOrtho(SCREEN_WIDTH/-2, SCREEN_WIDTH/2, SCREEN_HEIGHT/-2, SCREEN_HEIGHT/2, -100, 100);
    
    glUseProgram(program);
    glUniform1i(sampleUniformLocation, 0);
    glUniformMatrix4fv(mvpMatrixUniformLocation, 1, NO, projectMatrix.m);
    
    // 帧数
    labelFPS = [[UILabel alloc] initWithFrame:CGRectMake(5, 290, 200, 25)]; 
    labelFPS.font = [UIFont systemFontOfSize:30];
    labelFPS.textColor = [UIColor whiteColor];
    labelFPS.backgroundColor = [UIColor clearColor];
    
    [director.viewController.view addSubview:labelFPS];
}

#pragma mark - control game
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    frameCount++;
    accumTime += timeSinceLastUpdate;
    
    if (accumTime > 0.1)
    {
        labelFPS.text = [NSString stringWithFormat:@"%.1f", frameCount/accumTime];

        frameCount = 0;
        accumTime = 0;
    }
}
- (void)render
{
#ifdef USE_VERTEX_BUFFER
    glVertexAttribPointer(TKVertexAttribPosition, 4, GL_FLOAT, GL_FALSE, VERTEX_BYTES_LENGTH, vertexData);
    glVertexAttribPointer(TKVertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, TEXCOORD_BYTES_LENGTH, texCoordData);
 
    glUniformMatrix4fv(mvpMatrixUniformLocation, 1, NO, projectMatrix.m);
    
    NSInteger index;
    for (index = 0; index < spriteCount; index++)
    {
        glUniform1f(alphaUniformLocation, alphaData[index]);
        glBindTexture(GL_TEXTURE_2D, textureNameData[index]);
        glDrawArrays(GL_TRIANGLE_FAN, index*4, 4);
    }
    
    spriteCount = 0;
#endif
}

#pragma mark - utility
- (void)renderSpriteNode:(TKSpriteNode*)spriteNode
{
#ifdef USE_VERTEX_BUFFER
    NSInteger vertexDataLen = 4*VERTEX_BYTES_LENGTH;
    NSInteger texCoordDataLen = 4*TEXCOORD_BYTES_LENGTH;
    
    memcpy(vertexData + spriteCount*vertexDataLen, spriteNode.vertexData, vertexDataLen);
    memcpy(texCoordData + spriteCount*texCoordDataLen, spriteNode.texCoordData, texCoordDataLen);
    alphaData[spriteCount] = spriteNode.layer.alpha;
    textureNameData[spriteCount] = spriteNode.sprite.texture.name;
    spriteCount++;
#else
    glVertexAttribPointer(TKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, VERTEX_STRIDE, spriteNode.vertexData);
    glVertexAttribPointer(TKVertexAttribTexCoord, 2, GL_FLOAT, GL_FALSE, VERTEX_STRIDE, spriteNode.vertexData+3);
    
    glUniform1f(alphaUniformLocation, spriteNode.layer.alpha);
    glBindTexture(GL_TEXTURE_2D, spriteNode.sprite.texture.name);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
#endif
}

- (void)dealloc
{
    if (self.program) {
        glDeleteProgram(self.program);
        self.program = 0;
    }
    
#ifdef USE_VERTEX_BUFFER
    free(vertexData);
    free(texCoordData);
    free(alphaData);
    free(textureNameData);
#endif
}

@end





