//
//  MMWrongState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//
import GameplayKit

class MMWrongState : MMGameState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMShowState.Type || stateClass is MMGameOverState.Type
    }
    
    
    override func didEnter(from previousState: GKState?) {
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            trans.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 1),
                SKAction.fadeIn(withDuration: 1),
                SKAction.run {
                    trans.removeFromParent()
                    if let sprite = self.game?.mike {
                        sprite.position = self.game?.center ?? CGPoint()
                        self.game?.scene.addChild(sprite)
                        sprite.spinHead()
                        sprite.run(SKAction.sequence([SKAction.run {
                            sprite.head.run(SKAction.repeat(SKAction.rotate(byAngle: 360, duration: 1.0), count: 10))
                        }
                            ,
                            SKAction.run {
                                sprite.removeFromParent()
                            }]))

                        
                    }
                }]))
        }
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
