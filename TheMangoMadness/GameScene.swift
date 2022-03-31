//
//  GameScene.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var backgroundButton : SKSpriteNode?
    
    private var blueButton : SKSpriteNode?
    private var redButton : SKSpriteNode?
    private var greenButton : SKSpriteNode?
    
    private var blueButtonAnimation: [SKTexture] = []
    private var redButtonAnimation: [SKTexture] = []
    private var greenButtonAnimation: [SKTexture] = []
    
    private var blueButtonGif : SKAction?
    private var redButtonGif: SKAction?
    private var greenButtonGif: SKAction?
    
    func blueAnimation(){
        for i in 0...4 {
            blueButtonAnimation.append(SKTexture(imageNamed: "blueButton\(i)"));
        }
        blueButtonGif = SKAction.animate(with: blueButtonAnimation, timePerFrame: 0.1)
        blueButton?.run(blueButtonGif!)
    }
    
    func redAnimation(){
        for i in 0...4 {
            redButtonAnimation.append(SKTexture(imageNamed: "redButton\(i)"));
        }
        redButtonGif = SKAction.animate(with: redButtonAnimation, timePerFrame: 0.1)
        redButton?.run(redButtonGif!)

    }
    
    func greenAnimation(){
        
        for i in 0...4 {
            greenButtonAnimation.append(SKTexture(imageNamed: "greenButton\(i)"));
        }
        greenButtonGif = SKAction.animate(with: greenButtonAnimation, timePerFrame: 0.1)
        greenButton?.run(greenButtonGif!)

    }
    
    override func sceneDidLoad() {

        backgroundButton = SKSpriteNode(color: .red, size: CGSize(width: self.size.width, height: self.size.height*0.2))
        backgroundButton?.position = CGPoint(x: 0, y: -self.size.height*0.4)
        backgroundButton?.zPosition = -10
        addChild(backgroundButton!)
        
        blueButton = SKSpriteNode(texture: SKTexture(imageNamed: "blueButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        blueButton?.position = CGPoint(x: self.size.width*0.3, y: -self.size.height*0.4)
        blueButton?.name = "blueButton"
        addChild(blueButton!)
        
        redButton = SKSpriteNode(texture: SKTexture(imageNamed: "redButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        redButton?.position = CGPoint(x: 0, y: -self.size.height*0.4)
        redButton?.zPosition = 1
        redButton?.name = "redButton"
        addChild(redButton!)
        
        greenButton = SKSpriteNode(texture: SKTexture(imageNamed: "greenButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        greenButton?.position = CGPoint(x: -self.size.width*0.3, y: -self.size.height*0.4)
        greenButton?.name = "greenButton"
        addChild(greenButton!)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if (node.name == "redButton") {
            redAnimation()
        }
        else{
            if (node.name == "blueButton"){
                blueAnimation()
            }
            else{
                if (node.name == "greenButton"){
                    greenAnimation()
                }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
