//
//  MMDoItState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//
import GameplayKit

class MMDoItState : MMGameState {
    
    var timer: TimeInterval = 7
    var completed: Bool = false 
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMRightState.Type || stateClass is MMWrongState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        print("DO IT NOW")
        
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            self.game?.audioInstance.playSoundEffect("Static.mp3")
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                    trans.removeFromParent()
                }]))
        }
        
        if let willy = game?.willy {
            willy.isHidden = true
            self.game?.scene.addChild(willy)
            willy.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                         SKAction.run {
                willy.isHidden = false
                willy.spinHead()
                willy.body.run(SKAction(named: "talkAnim")!)
            },
                                         SKAction.wait(forDuration: 1.5),
                                         SKAction.run {
                willy.removeFromParent()
                self.game?.touchEnabled = true
                self.game?.keyboard?.colorBlend = 0.0
            }]))
        }
        
        if let timer = game?.keyboard?.timer {
            timer.run(SKAction.sequence([SKAction(named: "doitAnim")!,
                                         SKAction(named: "timerAnim")!]))
            
        }
        
        
    }
    
    override func willExit(to nextState: GKState) {
        timer = 7
        game?.input.removeAll()
        completed = false
        game?.touchEnabled = false
        game?.keyboard?.colorBlend = 1.0
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        
        timer -= seconds
        if game?.input == game?.sequence {
            completed = true
        }
        
        
        if timer < 0 {
            if let count = game?.input.count {
                if count == game?.sequence.count {
                    if game?.input == game?.sequence {
                        completed = true
                    }
                }
            }
            if completed {
                self.stateMachine?.enter(MMRightState.self)
            }
            else {
                self.stateMachine?.enter(MMWrongState.self)
            }
        }
        if completed {
            self.stateMachine?.enter(MMRightState.self)
        }
        
        
    }
    
}
