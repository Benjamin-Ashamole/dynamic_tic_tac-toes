//
//  Player.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import Foundation

class Player {
    
    let name: String?
    let color: String?
    var pieces: [Piece]
    var isTurn: Bool = false
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
        self.pieces = []
    }
}
