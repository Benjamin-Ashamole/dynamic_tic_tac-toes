//
//  Piece.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import Foundation

class Piece {
    
    var currentPosition: String
    let rules = Rules()
    
    init(currentPosition: String) {
        self.currentPosition = currentPosition
    }
    
    func move(currentPosition:String, newPosition: String, p1: Player, p2: Player, index: Int) -> Bool {
        
        var playerArr: [Piece] = []
        
        if (p1.isTurn) {
            playerArr = p1.pieces
            playerArr[index].currentPosition = newPosition
            p1.pieces = playerArr
        } else {
            playerArr = p2.pieces
            playerArr[index].currentPosition = newPosition
            p2.pieces = playerArr
        }
        
        p1.isTurn = !p1.isTurn
        p2.isTurn = !p2.isTurn
        
        if (checkForWin(playerArr: playerArr)) {
            print("Player has won the game.")
            return true
        }
        
        return false
    }
    
    func checkForWin(playerArr: [Piece]) -> Bool {
        let arr = playerArr.map { piece in
            piece.currentPosition
        }
        var index: Int = 0
        
        for _ in rules.winningCombos {
            if (checkArrayEquality(ruleArr: rules.winningCombos[index], playerArr: arr)) {
                return true
            }
            index += 1
        }
        return false
    }
    
    
    func checkArrayEquality(ruleArr: [String], playerArr: [String]) -> Bool {
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
