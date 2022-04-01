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
        
        print(game?.sequence as Any)
        
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
                    self.game?.object?.texture = SKTexture(imageNamed: "bolla verde")
                    self.game?.audioInstance.playSoundEffect2("Button3.m4a")
                case 2:
                    self.game?.object?.texture = SKTexture(imageNamed: "bolla rossa")
                    self.game?.audioInstance.playSoundEffect2("Button1.m4a")
                default:
                    self.game?.object?.texture = SKTexture(imageNamed: "bolla blu")
                    self.game?.audioInstance.playSoundEffect2("Button2.m4a")
                }
                
                
                self.i += 1
                    
                },
            SKAction.run {self.game?.object?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
            SKAction.wait(forDuration: 0.1), SKAction.run{self.game?.object?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}])
        
        
        if let trans = game?.transitionSprite {
            game?.scene.addChild(trans)
            
            let noiseAnim = SKAction.sequence([SKAction(named: "staticAnim")!,
                                               SKAction.run {
                trans.removeFromParent()
            }])
            self.game?.audioInstance.playSoundEffect("Static.mp3")
            trans.run(noiseAnim)
        }
            
        self.game?.scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.run {
                if let obj = self.game?.object {
                    obj.alpha = 0
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
        i = 0
    }
    
    
}
