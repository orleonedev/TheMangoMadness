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
        scene.backgroundColor = SKColor.brown
        gameStateMachine?.enter(MMShowState.self)
        
        if let sprite = self.mike {
            sprite.position = self.center
            scene.addChild(sprite)
            sprite.spinHead()
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

