//
//  TKDynamicBuffer.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-22.
//

#import <Foundation/Foundation.h>

@interface TKDynamicBuffer : NSObject
{
    GLbyte*   _buffer;
    NSInteger _size;
    NSInteger _curIndex;
}

@property(assign, nonatomic) GLbyte* buffer;
@property(assign, nonatomic) NSInteger size;

- (id)initWithBufferSize:(NSInteger)size;
- (void)addData:(GLbyte*)data length:(NSInteger)dataLen;
- (void)doubleBuffer;
- (void)reset;

@end
