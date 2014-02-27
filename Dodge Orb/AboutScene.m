//
//  AboutScene.m
//  Orbpix 0.1
//
//  Created by Josh So on 22/02/2014.
//  Copyright (c) 2014 Edgee Network. All rights reserved.
//

#import "AboutScene.h"
#import "MenuScene.h"
#import "GameScene.h"

@implementation AboutScene



- (instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size]) {
        
        //background
        
        SKEmitterNode *background = [SKEmitterNode orb_emitterNamed:@"Background"];
        background.particlePositionRange = CGVectorMake(self.size.width*2, self.size.height*2);
        [background advanceSimulationTime:10];
        
        [self addChild:background];
        
        
        //ABOUT
        
        SKLabelNode *about = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Black"];
        
        about.text = @"About";
        about.fontSize = 50;
        about.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame) + 120);
        about.fontColor = [SKColor colorWithHue:0 saturation:0 brightness:1 alpha:1.0];
        
        [self addChild:about];
        
        //EDGEE NETWORK
        
        SKLabelNode *edgeenetwork = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Black"];
        
        edgeenetwork.text = @"Edgee Network";
        edgeenetwork.fontSize = 20;
        edgeenetwork.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame) + 60);
        edgeenetwork.fontColor = [SKColor colorWithHue:0 saturation:0 brightness:1 alpha:1.0];
        
        [self addChild:edgeenetwork];
        
        //JOSH SO
        
        SKLabelNode *joshso = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Black"];
        
        joshso.text = @"Josh So";
        joshso.fontSize = 15;
        joshso.position = CGPointMake(CGRectGetMidX(self.frame),
                                            CGRectGetMidY(self.frame) + 30);
        joshso.fontColor = [SKColor colorWithHue:0 saturation:0 brightness:1 alpha:1.0];
        
        [self addChild:joshso];
        
        //NEIL TUNG
        
        SKLabelNode *neiltung = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Black"];
        
        neiltung.text = @"Neil Tung";
        neiltung.fontSize = 15;
        neiltung.position = CGPointMake(CGRectGetMidX(self.frame),
                                      CGRectGetMidY(self.frame));
        neiltung.fontColor = [SKColor colorWithHue:0 saturation:0 brightness:1 alpha:1.0];
        
        [self addChild:neiltung];
        
        //Sprite nodes add to scene
        
        [self addChild: [self backButtonNode]];
        
    }
    return self;
}

//spirte nodes innit doe

- (SKSpriteNode *)backButtonNode
{
    SKSpriteNode *backNode = [SKSpriteNode spriteNodeWithImageNamed:@"Back.png"];
    
    backNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) -200);
    backNode.name = @"backButtonNode"; //how the fucking node is identified later
    
    return backNode;
    
}


//handling of the touching of the ass

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    
    
    //if ass touched...
    if ([node.name isEqualToString:@"backButtonNode"])
    {
        MenuScene *menu = [[MenuScene alloc] initWithSize:self.size];
        [self.view presentScene:menu transition:[SKTransition doorsOpenHorizontalWithDuration:0.5]];
    }
    
   
    
    
}



@end
