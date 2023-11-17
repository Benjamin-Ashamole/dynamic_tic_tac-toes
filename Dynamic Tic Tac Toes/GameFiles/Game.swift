//
//  Game.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/9/23.
//

import Foundation

enum GamePhase {
    case mounting
    case inPlay
}

class Game {
    
    let title: String?
    var gamePhase: GamePhase = .mounting
    var currentNode: Node?
    var players: (playerOne: Player, playerTwo: Player)
    
    init(title: String = "Tik Tac Toes", players: (playerOne: Player , playerTwo: Player) = (Player(), Player())) {
        self.title = title
        self.players = players
    }
    
    func checkForWin(playerArr: [Piece]) -> Bool {
        let arr = playerArr.map { piece in
            piece.currentPosition
        }
        var index: Int = 0
        
        for _ in Rules.winningCombos {
            if (checkArrayEquality(ruleArr: Rules.winningCombos[index], playerArr: arr)) {
                return true
            }
            index += 1
        }
        return false
    }
    
    
    private func checkArrayEquality(ruleArr: [String], playerArr: [String]) -> Bool {
        if (ruleArr == playerArr) {
            return true
        }
        if (ruleArr.count != playerArr.count) {
            return false
        }
        
        let sortedRuleArr = ruleArr.sorted()
        let sortedPlayerArr = playerArr.sorted()
        var index: Int = 0
        
        for item in sortedRuleArr {
            if (item != sortedPlayerArr[index]) {
                return false
            }
            index += 1
        }
        return true
    }
    
}
