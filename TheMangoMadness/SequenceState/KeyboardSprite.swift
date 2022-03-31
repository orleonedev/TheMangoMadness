//
//  KeyboardSprite.swift
//  TheMangoMadness
//
//  Created by Claudio Silvestri on 31/03/22.
//

import SpriteKit
import GameplayKit

class KeyboardSprite: SKNode {
    
    var backgroundButton : SKSpriteNode?
    
    var blueButton : SKSpriteNode?
    var redButton : SKSpriteNode?
    var greenButton : SKSpriteNode?
    
    var blueButtonAnimation: [SKTexture] = []
    var redButtonAnimation: [SKTexture] = []
    var greenButtonAnimation: [SKTexture] = []
    
    var blueButtonGif : SKAction?
    var redButtonGif: SKAction?
    var greenButtonGif: SKAction?
    
    init(blueSprite: String, greenSprite: String, redSprite: String, pos: CGPoint, scena: SKScene) {

        self.backgroundButton = SKSpriteNode(texture: SKTexture(imageNamed: "tastiera"), size: CGSize(width: scena.size.width, height: scena.size.height*0.2))
        self.backgroundButton?.position = CGPoint(x: 0, y: -(scena.size.height)*0.4)
        self.backgroundButton?.zPosition = -10
        
        self.blueButton = SKSpriteNode(texture: SKTexture(imageNamed: "blueButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.blueButton?.position = CGPoint(x: scena.size.width*0.3, y: -scena.size.height*0.4)
        self.blueButton?.name = "blueButton"
        
        self.redButton = SKSpriteNode(texture: SKTexture(imageNamed: "redButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.redButton?.position = CGPoint(x: 0, y: -scena.size.height*0.4)
        self.redButton?.zPosition = 1
        self.redButton?.name = "redButton"
        
        self.greenButton = SKSpriteNode(texture: SKTexture(imageNamed: "greenButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.greenButton?.position = CGPoint(x: -scena.size.width*0.3, y: -scena.size.height*0.4)
        self.greenButton?.name = "greenButton"
        
        super.init()
        self.addChild(backgroundButton!)
        self.addChild(blueButton!)
        self.addChild(redButton!)
        self.addChild(greenButton!)




    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let location = touches.first!.location(in: self)
//        let node = self.atPoint(location)
//
//        if (node.name == "redButton") {
//            redAnimation()
//        }
//        else{
//            if (node.name == "blueButton"){
//                blueAnimation()
//            }
//            else{
//                if (node.name == "greenButton"){
//                    greenAnimation()
//                }
//            }
//        }
//    }

//}
