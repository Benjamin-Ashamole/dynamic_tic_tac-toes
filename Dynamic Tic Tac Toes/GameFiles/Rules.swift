//
//  Rules.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/4/21.
//

import Foundation

struct Rules {
    static let winningCombos: [[String]] = [
        ["TL", "TM", "TR"],
        ["ML", "MM", "MR"],
        ["BL", "BM", "BR"],
        ["TL", "ML", "BL"],
        ["TM", "MM", "BM"],
        ["TR", "MR", "BR"],
        ["TL", "MM", "BR"],
        ["TR", "MM", "BL"],
    ]
    
    static let allowedMoves: [String: Array<String>] = [
        "TL": ["TM", "MM", "ML"],
        "TM": ["TL", "MM", "TR"],
        "TR": ["TM", "MM", "MR"],
        "ML": ["TL", "MM", "BL"],
        "MM": ["TL", "TM", "TR", "MR", "ML", "BL", "BM", "BR"],
        "MR": ["TR", "MM", "BR"],
        "BL": ["ML", "MM", "BM"],
        "BM": ["BL", "MM", "BR"],
        "BR": ["MR", "MM", "BMrio"]
    ]
}
