#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define H_Flame_VERTEX [[NSBundle mainBundle] pathForResource:@"flameShader" ofType:@"vsh"]
#define H_Flame_FRAGMENT [[NSBundle mainBundle] pathForResource:@"flameShader" ofType:@"fsh"]


@interface FlameModel : NSObject

-(instancetype)init;

-(void)draw;
@end
