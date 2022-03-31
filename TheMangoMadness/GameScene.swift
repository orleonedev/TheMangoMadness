//
//  GameScene.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var sequenceLabel: SKLabelNode?
    var showedNumber = 0{
        didSet{
            if (sequenceLabel != nil) {
                sequenceLabel?.text = "\(showedNumber)"
            }
        }
    }
    var counter = 3
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func createSequence(){
        let sequence = (1...counter).map( {_ in Int.random(in: 1...3)} )
        print(sequence)
        for i in 0...counter-1 {
            self.run(SKAction.sequence([SKAction.run {self.sequenceLabel?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
                                        SKAction.wait(forDuration: 0.1), SKAction.run{self.sequenceLabel?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}, SKAction.run{
                self.sequenceLabel?.run(SKAction.rotate(byAngle: 360.0, duration: 0.3))
                self.showedNumber = sequence[i]
                print("cycle at step \(i)")
            }, SKAction.wait(forDuration: 0.5),
                                        SKAction.run {self.sequenceLabel?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
                                        SKAction.wait(forDuration: 0.1), SKAction.run{self.sequenceLabel?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}]))
        }
    }
    
    override func didMove(to view: SKView) {
        sequenceLabel = SKLabelNode(fontNamed: "FreePixel.ttf")
        sequenceLabel?.position = CGPoint(x: 0, y: 0)
        sequenceLabel?.zPosition = 2
        sequenceLabel?.color = .white
        sequenceLabel?.text = "0"
        addChild(sequenceLabel!)
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run{self.createSequence()}, SKAction.wait(forDuration: 5.0)])))
    }
}
