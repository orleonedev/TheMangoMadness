//
//  MMGameState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import GameplayKit

class MMGameState : GKState {
    
        weak var game: SKScene?
        
        init(withGame: SKScene) {
            self.game = withGame
            
            super.init()
        }

}
