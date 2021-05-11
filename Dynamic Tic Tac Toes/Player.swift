//
//  Player.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import UIKit

class Player {
    
    let name: String
    let color: UIColor
    var pieces: [Piece]
    var isTurn: Bool
    
    init(name: String, color: UIColor, isTurn: Bool) {
        self.name = name
        self.color = color
        self.pieces = []
        self.isTurn = isTurn
    }
}
