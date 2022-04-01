//
//  MMSecondSequence.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import GameplayKit

class MMSecondSequence : MMSequenceState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMBaseSequence.Type || stateClass is MMThirdSequence.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        game?.kind = 2
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
