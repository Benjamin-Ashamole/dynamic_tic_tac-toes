//
//  Player.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import UIKit

class Player {
    
    var name: String
    var color: UIColor
    var pieces: [Piece]
    var isTurn: Bool
    
    var movePosition: (current: String?, next: String?)
    
    init(name: String = "", color: UIColor = .clear, isTurn: Bool = false) {
        self.name = name
        self.color = color
        self.pieces = []
        self.isTurn = isTurn
    }
}
