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
        self.head = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 64, height: 64))
        self.body = SKSpriteNode( color: SKColor.white, size: CGSize(width: 64, height: 64))
        self.smile = SKSpriteNode( color: SKColor.red, size: CGSize(width: 24, height: 12))
        super.init()
        
        self.body.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        self.smile.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        self.position = pos
        self.body.position = self.position
        self.head.position = CGPoint(x: self.position.x, y: self.position.y + 32)
        self.smile.position = CGPoint(x: self.head.position.x + 8, y: self.head.position.y - 16)
        self.addChild(body)
        self.addChild(head)
        self.addChild(smile)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spinHead() {
        head.run(SKAction.repeatForever(SKAction.rotate(byAngle: 180.0, duration: 2.0)))
        
    }
    
    func rage(){
        
        let ghigno = SKAction.move(by: CGVector(dx: 2.0, dy: 2.0), duration: 0.5)
        smile.run(SKAction.repeat(SKAction.sequence([ghigno, ghigno.reversed()]), count: 3))
        head.run(SKAction.repeat(SKAction.rotate(byAngle: 360, duration: 1.0), count: 10))
    }
    
    func happy(){
        let ghigno = SKAction.rotate(byAngle: 0.2, duration: 0.5)
        smile.run(SKAction.repeat(SKAction.sequence([ghigno, ghigno.reversed()]), count: 3))
    }
    
    func talk() {
        smile.run(SKAction.repeat(SKAction.sequence([SKAction.scale(to: 0.2, duration: 0.5),SKAction.scale(to: 1.0, duration: 0.5)]), count: 3))
    }
    
}
