//
//  MMThirdSequence.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//


import GameplayKit

class MMThirdSequence : MMSequenceState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMSecondSequence.Type || stateClass is MMFourthSequence.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        print("THIRD")

        game?.kind = 3
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
