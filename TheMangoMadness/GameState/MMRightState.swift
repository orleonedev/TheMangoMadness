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
            self.game?.audioInstance.playSoundEffect("Static.mp3")
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                self.game?.audioInstance.playSoundEffect("CorrectJingle.m4a")
                switch self.game?.kind {
                case 3:
                    self.game?.audioInstance.soundEffectPlayer?.rate = 1.1
                case 4:
                    self.game?.audioInstance.soundEffectPlayer?.rate = 1.2
                case 5:
                    self.game?.audioInstance.soundEffectPlayer?.rate = 1.3
                default:
                    self.game?.audioInstance.soundEffectPlayer?.rate = 1.0
                }
                    trans.removeFromParent()

                }]))
        }
        
        if let timer = game?.keyboard?.timer {
            timer.removeAllActions()
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
        print(game?.streak)
        print(game?.kind)
        if game!.kind < 5 {
            if game?.streak != 0 && game!.streak % 2 == 0 {
                
                switch game?.sequenceStateMachine?.currentState {
                case is MMBaseSequence:
                    game?.sequenceStateMachine?.enter(MMSecondSequence.self)
                case is MMSecondSequence:
                    game?.sequenceStateMachine?.enter(MMThirdSequence.self)
                case is MMThirdSequence:
                    game?.sequenceStateMachine?.enter(MMFourthSequence.self)
                case is MMFourthSequence:
                    game?.sequenceStateMachine?.enter(MMFifthSequence.self)
                default:
                    break
                }
            }
                
        }
        
        
        game?.score += 1
        game?.scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run {
                self.stateMachine?.enter(MMShowState.self)
            }]))
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
