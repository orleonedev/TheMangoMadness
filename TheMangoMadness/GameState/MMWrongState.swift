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
            trans.run(SKAction.sequence([SKAction(named: "staticAnim")!,
                SKAction.run {
                self.game?.audioInstance.playSoundEffect("WrongJingle.m4a")
                    trans.removeFromParent()
                }]))
            }
        if let timer = game?.keyboard?.timer {
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
