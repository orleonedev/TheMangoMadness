//
//  MMDoItState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//
import GameplayKit

class MMDoItState : MMGameState {
    
    var timer: TimeInterval = 5.0
    var completed: Bool = false
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMRightState.Type || stateClass is MMWrongState.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        if !completed{
            timer -= seconds
            
        }
        
        if timer < 0 {
            self.stateMachine?.enter(MMWrongState.self)
        }
        
    }
    
}
