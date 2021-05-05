//
//  Player.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import Foundation

class Player {
    
    let name: String?
    let pieces: [Piece]
    
    init(name: String) {
        self.name = name
        self.pieces = []
    }
}
