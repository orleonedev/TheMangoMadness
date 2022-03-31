//
//  MikeChar.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class ColorWilly: SKNode {
    
    var head: SKSpriteNode
    var body: SKSpriteNode
    
    override init() {
        self.head = SKSpriteNode(texture: SKTexture(imageNamed: "wheelface1"),color: SKColor.blue, size: CGSize(width: 128 , height: 128))
        self.body = SKSpriteNode(texture: SKTexture(imageNamed: "colorwillymic4"), color: SKColor.white, size: CGSize(width: 256, height: 256 ))
        
        super.init()
        
        
        
        self.body.position = self.position
        self.head.position = CGPoint(x: self.position.x, y: self.position.y + 64)
        self.head.zPosition = body.zPosition - 1
        self.addChild(head)
        self.addChild(body)
        
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spinHead() {
        head.removeAllActions()
        head.run(SKAction.repeatForever(SKAction.rotate(byAngle: 22.0, duration: 2.0)))
        
    }
    
    func rage(){
        head.removeAllActions()
        head.run(SKAction.repeatForever(SKAction.rotate(byAngle: 90, duration: 2.0)))
       
    }
    
    
    
}
