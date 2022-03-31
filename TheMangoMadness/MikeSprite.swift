//
//  MikeChar.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class MikeSprite: SKNode {
    
    var head: SKSpriteNode
    var body: SKSpriteNode
    var smile: SKSpriteNode
    
    init(headSprite: String, bodySprite: String, pos: CGPoint) {
        self.head = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 32, height: 32))
        self.body = SKSpriteNode( color: SKColor.white, size: CGSize(width: 32, height: 32))
        self.smile = SKSpriteNode( color: SKColor.red, size: CGSize(width: 12, height: 12))
        super.init()
        self.body.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        self.smile.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        self.position = pos
        self.body.position = self.position
        self.head.position = CGPoint(x: self.position.x, y: self.position.y + 16)
        self.smile.position = CGPoint(x: self.head.position.x + 8, y: self.head.position.y + 4)
        self.addChild(body)
        self.addChild(head)
        self.addChild(smile)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spinHead() {
        head.run(SKAction.repeatForever(SKAction.rotate(byAngle: 180.0, duration: 1.0)))
        
    }
}
