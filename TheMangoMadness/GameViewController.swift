//
//  GameViewController.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var game: MMGame?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        game = MMGame()
        if let scene = game?.scene {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
            // Present the scene
            if let view = self.view as! SKView? {
                scene.size = self.view.frame.size
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                view.showsPhysics = false
                view.showsFPS = false
                view.showsNodeCount = false
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
