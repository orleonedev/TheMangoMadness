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
        
        if let state = game?.kind {
            if state == 1 {
                game?.sequence = (1...3).map({_ in Int.random(in: 1...3)})
            }
            else if state == 2{
                game?.sequence = (1...4).map({_ in Int.random(in: 1...3)})
            }else {
                game?.sequence = (1...6).map({_ in Int.random(in: 1...3)})
            }
        }
        
        
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
                    self.game?.object?.texture = SKTexture(imageNamed: self.getElementTexture(streak: self.game!.kind, color: 1))
                    self.game?.audioInstance.playSoundEffect2("Button3.m4a")
                case 2:
                    self.game?.object?.texture = SKTexture(imageNamed: self.getElementTexture(streak: self.game!.kind, color: 2))
                    self.game?.audioInstance.playSoundEffect2("Button1.m4a")
                default:
                    self.game?.object?.texture = SKTexture(imageNamed: self.getElementTexture(streak: self.game!.kind, color: 3))
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
        
        let sequence = SKAction.sequence([cycle,SKAction.wait(forDuration: 1.0)])
        
        var fullSeq = SKAction.sequence([])
        if let numberOfCycles = game?.sequence.count {
            switch numberOfCycles {
            
            case 4:
                fullSeq = SKAction.sequence([sequence,sequence,sequence,sequence])
            case 5:
                fullSeq = SKAction.sequence([sequence,sequence,sequence,sequence,sequence])
            case 6:
                fullSeq = SKAction.sequence([sequence,sequence,sequence,sequence,sequence,sequence])
            default:
                fullSeq = SKAction.sequence([sequence,sequence,sequence])
            }

        }
                    
        self.game?.scene.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.run {
                if let obj = self.game?.object {
                    obj.alpha = 0
                    self.game?.scene.addChild(obj)
                }
            },
            fullSeq,
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
    
    func getElementTexture(streak: Int , color: Int ) -> String {
        var assets:[String]
        let element = GKShuffledDistribution(randomSource: GKRandomSource(), lowestValue: 0, highestValue: 3)
        var returnable: String
        switch color {
        case 1:
            assets = ["bolla verde","greenapple","greenbutter","greenclover"]
        case 2:
            assets = ["bolla rossa","redapple","redbutter","redclover"]
        default:
            assets = ["bolla blu","blueapple","bluebutter","blueclover"]
        }
        
        switch streak {
        case 4,5:
            returnable = assets[element.nextInt()]
        default:
            returnable = assets[0]
        }
        
        print(returnable)
        return returnable
    }
}
