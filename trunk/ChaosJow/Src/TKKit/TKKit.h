//
//  TKKit.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#ifndef ChaosJow_TKKit_h
#define ChaosJow_TKKit_h

#define TK_ASYNC_TASK_START \
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){

#define TK_ASYNC_TASK_END \
});

#endif
