//
//  MMGame.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class MMGame: NSObject, SceneDelegate {
    
    var audioInstance = SKTAudio.sharedInstance()
    var gameStateMachine: GKStateMachine?
    var sequenceStateMachine: GKStateMachine?
    private var _scene: MMScene?
    var prevUpdateTime: TimeInterval = 0
    var score: Int = 0
    var health: Int = 3
    var kind: Int = 1
    var streak: Int = 0
    
    var touchEnabled: Bool = false
    
    var scene: SKScene {
        get {
            if _scene == nil {
                _scene = MMScene()
                _scene!.sceneDelegate = self
            }
            return _scene!
        }
    }
    
    var willy: ColorWilly?
    var tvFrame: SKSpriteNode?
    var transitionSprite: SKSpriteNode?
    var keyboard: KeyboardSprite?
    
    var sequence: [Int] = []
    var input: [Int] = []
    var object: SKSpriteNode?
    var waiting: TimeInterval = 1.0
    
    override init() {
        
        self.willy = ColorWilly()

        super.init()
        
                
        let show = MMShowState(withGame: self)
        let doIT = MMDoItState(withGame: self)
        let wrong = MMWrongState(withGame: self)
        let right = MMRightState(withGame: self)
        let gameover = MMGameOverState(withGame: self)
        
        gameStateMachine = GKStateMachine(states: [show,doIT,wrong,right,gameover])
        
        let base = MMBaseSequence(withGame: self)
        let second = MMSecondSequence(withGame: self)
        let third = MMThirdSequence(withGame: self)
        let fourth = MMFourthSequence(withGame: self)
        let fifth = MMFifthSequence(withGame: self)
        
        self.sequenceStateMachine = GKStateMachine(states: [base,second,third,fourth,fifth])
        
    }
    
    func didMoveToView(scene: MMScene, view: SKView) {
        audioInstance.playBackgroundMusic("GameShowLoope.m4a")
        
        scene.backgroundColor = SKColor.darkGray
        
        
        self.object = SKSpriteNode(color: SKColor.black, size: CGSize(width: 256, height: 256))
        
        self.tvFrame = SKSpriteNode(color: SKColor.clear, size: CGSize(width: self.scene.size.width*0.85, height: self.scene.size.height*0.63))
        
        
        

        if let tvFrame = tvFrame  {
            tvFrame.position = CGPoint(x: center.x, y: center.y )
            tvFrame.zPosition = -14
            self.transitionSprite = SKSpriteNode(texture: SKTexture(imageNamed: "statico0"),color: SKColor.white, size: CGSize(width: scene.size.width*1.3, height: scene.size.height*1.3))
            transitionSprite?.position = tvFrame.position
            transitionSprite?.zPosition = -13
            object?.position = CGPoint(x: tvFrame.position.x, y: tvFrame.position.y + 64)
            self.scene.addChild(tvFrame)
        
        self.keyboard = KeyboardSprite(pos: CGPoint(), scena: scene)
        
            willy?.position = CGPoint(x: center.x, y: center.y )
            willy?.setScale(1.55)
            willy?.zPosition = -1
        
        gameStateMachine?.enter(MMShowState.self)
            sequenceStateMachine?.enter(MMBaseSequence.self)
        if let keyboardButtonSprite = self.keyboard {
            keyboardButtonSprite.position = self.center
            scene.addChild(keyboardButtonSprite)

            }
        }
        
    }
    
    func touchDown(node: SKNode) {

        if touchEnabled{
            if (node.name == "redButton") {
                    keyboard?.redAnimation()
                audioInstance.playSoundEffect2("Button1.m4a")
            input.append(2)
                print(input)
                }
                else{
                    if (node.name == "blueButton"){
                        audioInstance.playSoundEffect2("Button2.m4a")
                        keyboard?.blueAnimation()
                        input.append(3)
                        print(input)
                    }
                    else{
                        if (node.name == "greenButton"){
                            audioInstance.playSoundEffect2("Button3.m4a")
                            keyboard?.greenAnimation()
                            input.append(1)
                            print(input)
                        }
                    }
                }
            
        }
        
        if gameStateMachine?.currentState is MMGameOverState {
            if (node.name == "redButton") {
                scene.run(SKAction.sequence([SKAction.run {
                    self.keyboard?.redAnimation()
                    self.audioInstance.playSoundEffect2("Button1.m4a")
                },
                                             SKAction.run {
                    let newGame = MMGame()
                    let scene = newGame.scene
                    scene.size = (self.scene.size)
                    scene.scaleMode = .aspectFit
                    self.scene.view?.presentScene(scene, transition: .fade(withDuration: 1.5))
                }]))
                
            }
        }
    }
    
    func update(currentTime: TimeInterval, forScene scene: SKScene) {
        // Track the time delta since the last update.
        if prevUpdateTime < 0 {
            prevUpdateTime = currentTime
        }
        
        let dt = currentTime - prevUpdateTime
        prevUpdateTime = currentTime
        
        gameStateMachine?.update(deltaTime: dt)
        
        }

    
    }
    


extension MMGame {
    var center: CGPoint {
        get{
            return CGPoint(x: (self.scene.view?.center.x)!, y: (self.scene.view?.center.y)!)
        }
    }
    
    var topLeft: CGPoint{
        get {
            return CGPoint(x: (self.scene.view?.frame.minX)! + 16 , y: (self.scene.view?.frame.maxY)! - 80 )
        }
    }
    var topRight: CGPoint{
        get {
            return CGPoint(x: (self.scene.view?.frame.maxX)! - 16 , y: (self.scene.view?.frame.maxY)! - 80 )
        }
    }
    
    var BottomLeft: CGPoint{
        get {
            return CGPoint(x: (self.scene.view?.frame.minX)! + 16 , y: (self.scene.view?.frame.minY)! )
        }
    }
    var BottomRight: CGPoint{
        get {
            return CGPoint(x: (self.scene.view?.frame.maxX)! - 16, y: (self.scene.view?.frame.minY)! )
        }
    }
    
}

