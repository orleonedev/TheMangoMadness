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
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                print(self.game?.score)
//                    trans.removeFromParent()
//                    if let sprite = self.game?.mike {
//                        sprite.position = self.game?.center ?? CGPoint()
//                        self.game?.scene.addChild(sprite)
//                        sprite.spinHead()
//                        sprite.run(SKAction.sequence([
//                            SKAction.run {
//                                sprite.rage()
//                            },
//                            SKAction.run {
//                                sprite.removeFromParent()
//                            }]))
//
//                    }
                }]))
        }
        
    }
    
    
    
}
