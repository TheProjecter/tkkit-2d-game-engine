//
//  TKDynamicBuffer.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-22.
//

#import "TKDynamicBuffer.h"

@implementation TKDynamicBuffer

@synthesize buffer = _buffer;
@synthesize size = _size;

- (id)initWithBufferSize:(NSInteger)size
{
    if (self = [super init])
    {
        _size = size;
        _buffer = malloc(_size);
        _curIndex = 0;
    }
    return self;
}

- (void)addData:(GLbyte*)data length:(NSInteger)dataLen
{
    if (_curIndex + dataLen >= _size)
        [self doubleBuffer];
        
    memcpy(_buffer+_curIndex, data, dataLen);
    _curIndex += dataLen;
}

- (void)doubleBuffer
{
    GLbyte* newBuffer = malloc(_size<<1);
    memcpy(newBuffer, _buffer, _size);
    
    free(_buffer);
    _buffer = newBuffer;
    _size *=2;
}

- (void)reset
{
    _curIndex = 0;
}

@end
