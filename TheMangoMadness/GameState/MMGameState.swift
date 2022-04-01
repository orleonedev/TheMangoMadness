//
//  MMGameState.swift
//  TheMangoMadness
//
//  Created by Oreste Leone on 31/03/22.
//

import GameplayKit

class MMGameState : GKState {
    
    var streak: Int = 1
        weak var game: MMGame?
        
        init(withGame: MMGame) {
            self.game = withGame
            super.init()
        }

}
