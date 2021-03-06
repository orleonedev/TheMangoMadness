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
        print("FUCK YOU")
        
        
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            self.game?.audioInstance.playSoundEffect("Static.mp3")
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                self.game?.audioInstance.playSoundEffect("WrongJingle.m4a")
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
            timer.run(SKAction(named: "lameAnim")!)
            
        }
        
        if let willy = game?.willy {
            willy.isHidden = true
            willy.setScale(1.9)
            self.game?.scene.addChild(willy)
            willy.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                         SKAction.run {
                willy.isHidden = false
                willy.rage()
                willy.body.run(SKAction(named: "rageAnim")!)
            },
                                         SKAction.wait(forDuration: 2.5),
                                         SKAction.run {
                willy.setScale(1.55)
                willy.removeFromParent()
            }]))
        }
        
        if let c = game?.health{
            print(c)
            if let knob = game?.scene.childNode(withName: "//lifechannel\(String(format:"%.1d", c))") as? SKSpriteNode{
                knob.run(SKAction.sequence([SKAction.wait(forDuration: 1.5),
                                            SKAction.run {
                    knob.removeFromParent()
                }]))
                game?.health -= 1
            }
        }
        
        game?.streak = 0
        switch game?.sequenceStateMachine?.currentState {
        case is MMSecondSequence:
            game?.sequenceStateMachine?.enter(MMBaseSequence.self)
        case is MMThirdSequence:
            game?.sequenceStateMachine?.enter(MMSecondSequence.self)
        case is MMFourthSequence:
            game?.sequenceStateMachine?.enter(MMThirdSequence.self)
        case is MMFifthSequence:
            game?.sequenceStateMachine?.enter(MMFourthSequence.self)
        default:
            break
        }
        
        print("Health: \(game?.health)")
        if game?.health != 0 {game?.scene.run(SKAction.sequence([
                                               SKAction.wait(forDuration: 3.0),
                                               SKAction.run {
                      self.stateMachine?.enter(MMShowState.self)
                  }]))}
        else{
            game?.scene.run(SKAction.sequence([
                                                   SKAction.wait(forDuration: 3.0),
                                                   SKAction.run {
                          self.stateMachine?.enter(MMGameOverState.self)
                      }]))
        }
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
