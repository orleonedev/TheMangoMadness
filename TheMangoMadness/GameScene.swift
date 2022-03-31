//
//  GameScene.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let guessButton = SKSpriteNode(imageNamed: "guess")
    let wrongButton = SKSpriteNode(imageNamed: "wrong")
    var controlling = false
    var comparing: [Int] = []
    var sequenceLabel: SKLabelNode?
    var showedNumber = 0{
        didSet{
            if (sequenceLabel != nil) {
                sequenceLabel?.text = "\(showedNumber)"
            }
        }
    }
    var button1 = SKSpriteNode()
    var button2 = SKSpriteNode()
    var button3 = SKSpriteNode()
    var counter = 3
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let nodeAtPoint = atPoint(touchLocation)
        if controlling {
            if let touchedNode = nodeAtPoint as? SKSpriteNode {
                if touchedNode.name?.starts(with: "Button1") == true {
                    if comparing.count < 3 {
                    comparing.append(1)
                    print("pressed button1")
                }
                }
                if touchedNode.name?.starts(with: "Button2") == true {
                    if comparing.count < 3 {
                    comparing.append(2)
                    print("pressed button2")
                }
                }
                if touchedNode.name?.starts(with: "Button3") == true {
                    if comparing.count < 3 {
                    comparing.append(3)
                    print("pressed button3")
                }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func createSequence(){
        guessButton.isHidden = true
        wrongButton.isHidden = true
        var guessed = false
        comparing = []
        controlling = false
        guessButton.isHidden = true
        let sequence = (1...counter).map({_ in Int.random(in: 1...3)})
        var i = 0
        print(sequence)
        let cycle = SKAction.sequence([SKAction.run {self.sequenceLabel?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
                                       SKAction.wait(forDuration: 0.1), SKAction.run{self.sequenceLabel?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}, SKAction.run{
            self.showedNumber = sequence[i]
            i += 1
            print("cycle at step \(i)")
        },
                                       SKAction.run {self.sequenceLabel?.run(SKAction.fadeAlpha(to: 0.0, duration: 0.2))},
                                       SKAction.wait(forDuration: 0.1), SKAction.run{self.sequenceLabel?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))}])
        self.run(SKAction.sequence([cycle, SKAction.wait(forDuration: 0.5), cycle, SKAction.wait(forDuration: 0.5), cycle, SKAction.run{
            self.controlling = true
            print("Try to guess now.")
        }, SKAction.wait(forDuration: 3.0),
                                    SKAction.run{if self.comparing.count == sequence.count{
                                        
                                        for i in 0..<sequence.count {
                                            
                                            if self.comparing[i] != sequence[i] {
                                                
                                                guessed = false
                                                break
                                            } else {
                                                guessed = true
                                    }
                                        }
                                        if guessed {
                                            print("correct!")
                                            self.guessButton.isHidden = false
                                            
                                        }
                                        else {
                                            print("wrong!!")
                                            self.wrongButton.isHidden = false
                                        }
                                    }
            else {
                print("no response!")
                self.wrongButton.isHidden = false
            }
                                    }]))
    }
    
    override func didMove(to view: SKView) {
        
        if let gameo = self.childNode(withName: "Button1") as? SKSpriteNode {
            button1 = gameo
        }
        
        if let gameo = self.childNode(withName: "Button2") as? SKSpriteNode {
            button2 = gameo
        }
        
        if let gameo = self.childNode(withName: "Button3") as? SKSpriteNode {
            button3 = gameo
        }
        
        guessButton.setScale(0.2)
        guessButton.position = CGPoint(x: 0, y: -90)
        guessButton.zPosition = 2
        guessButton.isHidden = true
        addChild(guessButton)
        
        wrongButton.setScale(0.2)
        wrongButton.position = CGPoint(x:0, y: -90)
        wrongButton.zPosition = 2
        wrongButton.isHidden = true
        addChild(wrongButton)
        
        sequenceLabel = SKLabelNode(fontNamed: "FreePixel.ttf")
        sequenceLabel?.position = CGPoint(x: 0, y: 0)
        sequenceLabel?.zPosition = 2
        sequenceLabel?.color = .white
        sequenceLabel?.text = "0"
        addChild(sequenceLabel!)
        
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run{self.createSequence()}, SKAction.wait(forDuration: 7.0)])))
    }
}
