//
//  GameScene.h
//  Orbpix
//

//  Copyright (c) 2014 Edgee Network. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

@end


@interface SKEmitterNode (fromFile)
+ (instancetype)orb_emitterNamed:(NSString*)name;
@end


