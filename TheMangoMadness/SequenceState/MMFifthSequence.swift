//
//  MMFifthSequence.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//


import GameplayKit

class MMFifthSequence : MMSequenceState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMFourthSequence.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        print("FIFTH")
        game?.audioInstance.backgroundMusicPlayer?.rate = 2.0
        game?.kind = 5
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
