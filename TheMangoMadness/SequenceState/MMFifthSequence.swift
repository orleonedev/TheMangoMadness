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
        game?.waiting = 0.3
        game?.audioInstance.backgroundMusicPlayer?.rate = 1.5
        game?.kind = 5
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
