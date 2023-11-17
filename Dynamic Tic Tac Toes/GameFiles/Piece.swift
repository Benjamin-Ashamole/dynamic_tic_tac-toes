//
//  Piece.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import Foundation

typealias Position = String

class Piece {
    
    var currentPosition: String
    
    init(currentPosition: String) {
        self.currentPosition = currentPosition
    }
    
    public func movePiece(for player: Player) {
        let pieces = player.pieces
        let index = player.pieces.firstIndex { piece in
            piece.currentPosition == player.movePosition.current
        } ?? 0
        
        pieces[index].currentPosition = player.movePosition.next ?? ""
    }
}
