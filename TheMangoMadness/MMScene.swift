//
//  MMScene.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import Foundation
import SpriteKit
import GameplayKit

protocol SceneDelegate: SKSceneDelegate {
    func didMoveToView(scene: MMScene , view: SKView)
    func touchDown()
}

class MMScene: SKScene {
    
    var sceneDelegate: SceneDelegate?
    
    override func didMove(to view: SKView) {
        sceneDelegate?.didMoveToView(scene: self, view: view)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let game = sceneDelegate as? MMGame {
            game.update(currentTime: currentTime, forScene: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let game = sceneDelegate as? MMGame? {
            game?.touchDown()
        }
    }
    
}
