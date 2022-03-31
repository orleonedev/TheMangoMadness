//
//  MMShowState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import GameplayKit

class MMShowState : MMGameState {
    var i: Int = 0
    
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMDoItState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        
        game?.sequence = (1...3).map({_ in Int.random(in: 1...3)})
        
        print(game?.sequence)
        
        let cycle = SKAction.sequence([
            SKAction.run {
                self.game?.object?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))
                },
            SKAction.wait(forDuration: 0.1),
            SKAction.run{
                self.game?.object?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))
                },
            SKAction.run{
                switch self.game?.sequence[self.i] {
                case 1:
                    self.game?.object?.color = SKColor.green
                case 2:
                    self.game?.object?.color = SKColor.red
                default:
                    self.game?.object?.color = SKColor.blue
                }
                
                self.game?.object?.position = self.game!.center
                self.i += 1
                    
                },
            SKAction.run {self.game?.object?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
            SKAction.wait(forDuration: 0.1), SKAction.run{self.game?.object?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}])
        
        
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            
            let noiseAnim = SKAction.sequence([SKAction.fadeOut(withDuration: 1.0),
                                               SKAction.run {
                trans.removeFromParent()
            }])
            
            trans.run(noiseAnim)
        }
            
        self.game?.scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.0),
            SKAction.run {
                if let obj = self.game?.object {
                    self.game?.scene.addChild(obj)
                }
            },
            cycle,
            SKAction.wait(forDuration: 1.0),
            cycle,
            SKAction.wait(forDuration: 1.0),
            cycle,
            SKAction.wait(forDuration: 1.0),
            SKAction.run {
                if let obj = self.game?.object {
                    obj.removeFromParent()
                }
                self.stateMachine?.enter(MMDoItState.self)
            }
        ]))
            
            
        
        
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
    
}
