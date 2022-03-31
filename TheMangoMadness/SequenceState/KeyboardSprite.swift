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
    
    var lifechannel1 : SKSpriteNode?
    var lifechannel2 : SKSpriteNode?
    var lifechannel3 : SKSpriteNode?
    
    var scenaCompleta : SKSpriteNode?
    var canale : SKSpriteNode?
    var vitaoffe : SKSpriteNode?
    var timer : SKSpriteNode?
    
    var blueButtonAnimation: [SKTexture] = []
    var redButtonAnimation: [SKTexture] = []
    var greenButtonAnimation: [SKTexture] = []
    var countdownAnimation: [SKTexture] = []
    
    var countdownGif : SKAction?
    var blueButtonGif : SKAction?
    var redButtonGif: SKAction?
    var greenButtonGif: SKAction?
    
    init(pos: CGPoint, scena: SKScene) {

        self.backgroundButton = SKSpriteNode(texture: SKTexture(imageNamed: "tastiera"), size: CGSize(width: scena.size.width, height: scena.size.height*0.2))
        self.backgroundButton?.position = CGPoint(x: 0, y: -(scena.size.height)*0.4)
        self.backgroundButton?.zPosition = -10
        
        self.scenaCompleta = SKSpriteNode(texture: SKTexture(imageNamed: "Scenacompletagioco1"), size: CGSize(width: scena.size.width, height: scena.size.height * 1.07))
        self.scenaCompleta?.position = CGPoint(x: 0, y: -(scena.size.height)*0.032)
        self.scenaCompleta?.zPosition = -11
        
        self.canale = SKSpriteNode(texture: SKTexture(imageNamed: "Canale"), size: CGSize(width: scena.size.width, height: scena.size.height * 1.07))
        self.canale?.position = CGPoint(x: 0, y: -(scena.size.height)*0.032)
        self.canale?.zPosition = -12
        
        self.vitaoffe = SKSpriteNode(texture: SKTexture(imageNamed: "vitaoffesfondo"), size: CGSize(width: scena.size.width, height: scena.size.height * 1.07))
        self.vitaoffe?.position = CGPoint(x: 0, y: -(scena.size.height)*0.032)
        self.vitaoffe?.zPosition = -12
        
        self.lifechannel1 = SKSpriteNode(texture: SKTexture(imageNamed: "pulsantevita"), size: CGSize(width: backgroundButton!.size.width*0.1, height: backgroundButton!.size.height*0.25))
        self.lifechannel1?.position = CGPoint(x: scena.size.width*0.073, y: scena.size.height*0.437)
        self.lifechannel1?.name = "lifechannel1"
        
        self.lifechannel2 = SKSpriteNode(texture: SKTexture(imageNamed: "pulsantevita"), size: CGSize(width: backgroundButton!.size.width*0.1, height: backgroundButton!.size.height*0.25))
        self.lifechannel2?.position = CGPoint(x: -scena.size.width*0.122, y: scena.size.height*0.437)
        self.lifechannel2?.name = "lifechannel2"
        
        self.lifechannel3 = SKSpriteNode(texture: SKTexture(imageNamed: "pulsantevita"), size: CGSize(width: backgroundButton!.size.width*0.1, height: backgroundButton!.size.height*0.25))
        self.lifechannel3?.position = CGPoint(x: -scena.size.width*0.317, y: scena.size.height*0.437)
        self.lifechannel3?.name = "lifechannel3"
        
        self.blueButton = SKSpriteNode(texture: SKTexture(imageNamed: "blueButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.blueButton?.position = CGPoint(x: scena.size.width*0.3, y: -scena.size.height*0.378)
        self.blueButton?.name = "blueButton"
        
        self.redButton = SKSpriteNode(texture: SKTexture(imageNamed: "redButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.redButton?.position = CGPoint(x: 0, y: -scena.size.height*0.378)
        self.redButton?.zPosition = 1
        self.redButton?.name = "redButton"
        
        self.greenButton = SKSpriteNode(texture: SKTexture(imageNamed: "greenButton0"), size: CGSize(width: backgroundButton!.size.width*0.2, height: backgroundButton!.size.height*0.4))
        self.greenButton?.position = CGPoint(x: -scena.size.width*0.3, y: -scena.size.height*0.378)
        self.greenButton?.name = "greenButton"
        
        self.timer = SKSpriteNode(texture: SKTexture(imageNamed: "timerbig0"), size: CGSize(width: backgroundButton!.size.width*0.55, height: backgroundButton!.size.height*0.45))
        self.timer?.position = CGPoint(x: 0, y: -scena.size.height*0.26)
        self.timer?.name = "timer"
        
        super.init()
        
        self.addChild(backgroundButton!)
        self.addChild(scenaCompleta!)
        self.addChild(canale!)
        self.addChild(vitaoffe!)
        self.addChild(lifechannel1!)
        self.addChild(lifechannel2!)
        self.addChild(lifechannel3!)
        self.addChild(blueButton!)
        self.addChild(redButton!)
        self.addChild(greenButton!)
        self.addChild(timer!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func blueAnimation(){
        blueButtonAnimation.removeAll()
        for i in 0...4 {
            blueButtonAnimation.append(SKTexture(imageNamed: "blueButton\(i)"));
        }
        blueButtonGif = SKAction.animate(with: blueButtonAnimation, timePerFrame: 0.1)
        blueButton?.run(blueButtonGif!)
    }
    
    func redAnimation(){
        redButtonAnimation.removeAll()
        for i in 0...4 {
            redButtonAnimation.append(SKTexture(imageNamed: "redButton\(i)"));
        }
        redButtonGif = SKAction.animate(with: redButtonAnimation, timePerFrame: 0.1)
        redButton?.run(redButtonGif!)

    }
    
    func greenAnimation(){
        greenButtonAnimation.removeAll()
        for i in 0...4 {
            greenButtonAnimation.append(SKTexture(imageNamed: "greenButton\(i)"));
        }
        greenButtonGif = SKAction.animate(with: greenButtonAnimation, timePerFrame: 0.1)
        greenButton?.run(greenButtonGif!)

    }
    
    
    func timerAnimation(){
        countdownAnimation.removeAll()
        for i in 0...12 {
            countdownAnimation.append(SKTexture(imageNamed: "timerbig\(i)"));
        }
        countdownGif = SKAction.animate(with: countdownAnimation, timePerFrame: 0.5)
        timer?.run(countdownGif!)

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
