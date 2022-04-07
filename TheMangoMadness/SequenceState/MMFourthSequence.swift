//
//  MMFourthSequence.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//


import GameplayKit

class MMFourthSequence : MMSequenceState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is MMThirdSequence.Type || stateClass is MMFifthSequence.Type
    }
    
    override func didEnter(from previousState: GKState?) {
        print("FOURTH")
        game?.waiting = 0.5
        game?.audioInstance.backgroundMusicPlayer?.rate = 1.5
        game?.kind = 4
        
        
    }
    
    override func willExit(to nextState: GKState) {
        
    }
    
}
