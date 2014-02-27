//
//  MenuScene.m
//  Orbpix
//
//  Created by Josh So on 20/02/2014.
//  Copyright (c) 2014 Edgee Network. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"
#import "ScoreScene.h"
#import "AboutScene.h"
#import "SKButton.h"

@implementation MenuScene

//title and background v

- (instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]) {
        
        
        SKEmitterNode *background = [SKEmitterNode orb_emitterNamed:@"Background"];
            background.particlePositionRange = CGVectorMake(self.size.width*2, self.size.height*2);
            [background advanceSimulationTime:10];
        
        [self addChild:background];
        
        //the o
        
        SKEmitterNode *o = [SKEmitterNode orb_emitterNamed:@"O"];
        o.position = CGPointMake(CGRectGetMidX(self.frame)- 50 , CGRectGetMidY(self.frame) + 120);
        
        [self addChild:o];
        
        
        
        //Sprite nodes added below
        
        [self addChild: [self playButtonNode]];
        
        [self addChild: [self scoreButtonNode]];
        
        [self addChild: [self aboutButtonNode]];
        
        [self addChild: [self RBPIXNode]];
        
    }
    return self;
}

//Sprite Node below, remember to add to scene above






- (SKSpriteNode *)RBPIXNode
{
    SKSpriteNode *RBPIXNode = [SKSpriteNode spriteNodeWithImageNamed:@"RBPIX.png"];
    
    RBPIXNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) +120);
    RBPIXNode.name = @"RBPIXNode"; //how the node is identified later
    
    return RBPIXNode;
    
}








- (SKSpriteNode *)playButtonNode
{
    SKSpriteNode *playNode = [SKSpriteNode spriteNodeWithImageNamed:@"Play.png"];
    
    playNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) +20);
    playNode.name = @"playButtonNode"; //how the node is identified later
    
    return playNode;
    
}


- (SKSpriteNode *)scoreButtonNode
{
    SKSpriteNode *scoreNode = [SKSpriteNode spriteNodeWithImageNamed:@"Score.png"];
    
    scoreNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) -30);
    scoreNode.name = @"scoreButtonNode"; //how the node is identified later
    
    return scoreNode;
    
}



- (SKSpriteNode *)aboutButtonNode
{
    SKSpriteNode *aboutNode = [SKSpriteNode spriteNodeWithImageNamed:@"About.png"];
    
    aboutNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame) -80);
    aboutNode.name = @"aboutButtonNode"; //how the node is identified later
    
    return aboutNode;
    
}


//handling touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    
    
    //if button touched...
    if ([node.name isEqualToString:@"playButtonNode"])
    {
        GameScene *game = [[GameScene alloc] initWithSize:self.size];
        [self.view presentScene:game transition:[SKTransition doorsOpenHorizontalWithDuration:0.5]];
    }
    
    if ([node.name isEqualToString:@"scoreButtonNode"])
    {
        ScoreScene *score = [[ScoreScene alloc] initWithSize:self.size];
        [self.view presentScene:score transition:[SKTransition doorsCloseHorizontalWithDuration:0.5]];
    }
    
    if ([node.name isEqualToString:@"aboutButtonNode"])
    {
        AboutScene *about = [[AboutScene alloc] initWithSize:self.size];
        [self.view presentScene:about transition:[SKTransition doorsCloseHorizontalWithDuration:0.5]];
    }
    
    
}



@end
