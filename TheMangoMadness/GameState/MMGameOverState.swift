//
//  MMGameOverState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import GameplayKit

class MMGameOverState : MMGameState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return false
    }
    
    override func didEnter(from previousState: GKState?) {
        print("END")
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            self.game?.audioInstance.playSoundEffect("Static.mp3")
            self.game?.audioInstance.soundEffectPlayer?.numberOfLoops = -1
            trans.run(SKAction.repeatForever(SKAction(named: "staticAnim")!))
        }
        
        let overlay = SKSpriteNode(color: .black, size: game?.scene.size ?? CGSize())
        overlay.position = game?.center ?? CGPoint()
        overlay.zPosition = -1
        overlay.name = "gameOverOverlay"
        overlay.alpha = 0.0
        
        game?.scene.addChild(overlay)
        overlay.run(SKAction.fadeAlpha(to: 0.8, duration: 2.0))
        
        if let finalScore = game?.score {
            let scoreLabel = SKLabelNode(text:"SCORE \(String(format: "%d", finalScore))")
            scoreLabel.fontName = "PixelText"
            scoreLabel.fontSize = 128.0
            scoreLabel.position = CGPoint(x: game?.center.x ?? 0.0, y: (game?.center.y ?? 0.0) + 64.0  )
            scoreLabel.alpha = 0.0
            scoreLabel.zPosition = 15
            
            game?.scene.addChild(scoreLabel)
            scoreLabel.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        let smile = SKSpriteNode(color: .white, size: CGSize(width: 256, height: 256))
        smile.position = game?.center ?? CGPoint()
        smile.zPosition = -12
        smile.alpha = 0.0
        game?.scene.addChild(smile)
        smile.run(SKAction.fadeIn(withDuration: 5.0))
        
        
        
        if let redpuls = game?.keyboard?.redButton {
            redpuls.colorBlendFactor = 0.0
            redpuls.color = .gray
            let pulse = SKAction.colorize(withColorBlendFactor: 0.05, duration: 0.5)
            let sequence = SKAction.sequence([pulse, pulse.reversed()])
            redpuls.run(SKAction.repeatForever(sequence))
            
        }
    }
    
    
    
}
