//
//  MMRightState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//
import GameplayKit

class MMRightState : MMGameState {
    
    
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMShowState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                self.game?.audioInstance.playSoundEffect("CorrectJingle.m4a")
                    trans.removeFromParent()

                }]))
        }
        
        if let timer = game?.keyboard?.timer {
            timer.run(SKAction(named: "goodAnim")!)
            
        }
        
        if let willy = game?.willy {
            willy.isHidden = true
            self.game?.scene.addChild(willy)
            willy.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                         SKAction.run {
                willy.isHidden = false
                willy.spinHead()
                willy.body.run(SKAction(named: "happyAnim")!)
            },
                                         SKAction.wait(forDuration: 2.5),
                                         SKAction.run {
                willy.removeFromParent()
            }]))
        }
        
        game?.streak += 1
        game?.score += 10
        game?.scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run {
                self.stateMachine?.enter(MMShowState.self)
            }]))
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
