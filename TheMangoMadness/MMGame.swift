//
//  MMGame.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class MMGame: NSObject, SceneDelegate {
    
    var gameStateMachine: GKStateMachine?
    private var _scene: MMScene?
    var prevUpdateTime: TimeInterval = 0
    
    var scene: SKScene {
        get {
            if _scene == nil {
                _scene = MMScene()
                _scene!.sceneDelegate = self
            }
            return _scene!
        }
    }
    
    var mike: MikeSprite?
    var tvFrame: SKSpriteNode?
    var transitionSprite: SKSpriteNode?
    var keyboard: KeyboardSprite?
    
    var sequence: [Int] = []
    var object: SKSpriteNode?
    
    override init() {
        
        self.mike = MikeSprite(headSprite: "bruh", bodySprite: "bruh", pos: CGPoint())

        super.init()
        
                
        let show = MMShowState(withGame: self)
        let doIT = MMDoItState(withGame: self)
        let wrong = MMWrongState(withGame: self)
        let right = MMRightState(withGame: self)
        let gameover = MMGameOverState(withGame: self)
        
        gameStateMachine = GKStateMachine(states: [show,doIT,wrong,right,gameover])
        
    }
    
    func didMoveToView(scene: MMScene, view: SKView) {
        scene.backgroundColor = SKColor.gray
        
        
        self.object = SKSpriteNode(color: SKColor.black, size: CGSize(width: 64, height: 64))
        
        self.tvFrame = SKSpriteNode(color: SKColor.black, size: CGSize(width: self.scene.size.width*0.9, height: self.scene.size.height*0.7))

        if let tvFrame = tvFrame  {
            tvFrame.position = CGPoint(x: center.x, y: center.y + 100)
            self.transitionSprite = SKSpriteNode(color: SKColor.white, size: CGSize(width: tvFrame.size.width*0.9, height: tvFrame.size.height*0.95))
            transitionSprite?.position = tvFrame.position
            object?.position = CGPoint(x: tvFrame.position.x, y: tvFrame.position.y + 64)
            self.scene.addChild(tvFrame)
        
        self.keyboard = KeyboardSprite(blueSprite: "blueButton", greenSprite: "greenButton", redSprite: "redButton", pos: CGPoint(), scena: scene)
        
        
        gameStateMachine?.enter(MMShowState.self)
        if let keyboardButtonSprite = self.keyboard {
            keyboardButtonSprite.position = self.center
            scene.addChild(keyboardButtonSprite)

            }
        }
        
    }
    
    func touchDown(node: SKNode) {

        if (node.name == "redButton") {
                    keyboard?.redAnimation()
                }
                else{
                    if (node.name == "blueButton"){
                        keyboard?.blueAnimation()
                    }
                    else{
                        if (node.name == "greenButton"){
                            keyboard?.greenAnimation()
                        }
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

