//
//  MMBaseSequence.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//


import GameplayKit

class MMBaseSequence : MMSequenceState {
    
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMSecondSequence.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
