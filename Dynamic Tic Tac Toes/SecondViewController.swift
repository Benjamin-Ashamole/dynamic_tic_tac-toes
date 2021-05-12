//
//  SecondViewController.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/3/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var gameArr: [String]! = []
    private var count: Int = 0
    let allowedMoves = Rules().allowedMoves
    
    
    var TL: UIButton!
    var BL: UIButton!
    var ML: UIButton!
    var MM: UIButton!
    var BM: UIButton!
    var TM: UIButton!
    var TR: UIButton!
    var MR: UIButton!
    var BR: UIButton!
    
    var p1 = Player(name: "Player 1", color: .red, isTurn: true)
    var p2 = Player(name: "Player 2", color: .purple, isTurn: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buildGameUI()
    }
    
    func buildGameUI() {
        
        
        TL = UIButton(type: .custom)
        
        let gameView = ViewWithDiagonalLine()
        gameView.frame = CGRect(x: 28, y: 150, width: view.frame.size.width - 55, height: view.frame.size.height - 300)
        gameView.layer.borderColor = UIColor.black.cgColor
        gameView.layer.borderWidth = 4
                   view.addSubview(gameView)
        
        
        TL.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        TL.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.minY)
        TL.setTitle("TL", for: .normal)
        TL.setTitleColor(.black, for: .normal)
        TL.layer.cornerRadius = 0.5 * TL.bounds.size.width
        TL.clipsToBounds = true
        TL.backgroundColor = .black
        TL.addTarget(self, action: #selector(tlTapped), for: .touchUpInside)
        gameView.addSubview(TL)
        
        
        BL = UIButton(type: .custom)
        BL.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        BL.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.maxY)
        BL.setTitle("BL", for: .normal)
        BL.setTitleColor(.black, for: .normal)
        BL.layer.cornerRadius = 0.5 * BL.bounds.size.width
        BL.clipsToBounds = true
        BL.backgroundColor = .black
        BL.addTarget(self, action: #selector(blTapped), for: .touchUpInside)
        gameView.addSubview(BL)
        
        ML = UIButton(type: .custom)
        ML.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        ML.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.midY)
        ML.setTitle("ML", for: .normal)
        ML.setTitleColor(.black, for: .normal)
        ML.layer.cornerRadius = 0.5 * ML.bounds.size.width
        ML.clipsToBounds = true
        ML.backgroundColor = .black
        ML.addTarget(self, action: #selector(mlTapped), for: .touchUpInside)
        gameView.addSubview(ML)
        
        MM = UIButton(type: .custom)
        MM.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        MM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.midY)
        MM.setTitle("MM", for: .normal)
        MM.setTitleColor(.black, for: .normal)
        MM.layer.cornerRadius = 0.5 * MM.bounds.size.width
        MM.clipsToBounds = true
        MM.backgroundColor = .black
        MM.addTarget(self, action: #selector(mmTapped), for: .touchUpInside)
        gameView.addSubview(MM)
        
        BM = UIButton(type: .custom)
        BM.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        BM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.maxY)
        BM.setTitle("BM", for: .normal)
        BM.setTitleColor(.black, for: .normal)
        BM.layer.cornerRadius = 0.5 * BM.bounds.size.width
        BM.clipsToBounds = true
        BM.backgroundColor = .black
        BM.addTarget(self, action: #selector(bmTapped), for: .touchUpInside)
        gameView.addSubview(BM)
        
        TM = UIButton(type: .custom)
        TM.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        TM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.minY)
        TM.setTitle("TM", for: .normal)
        TM.setTitleColor(.black, for: .normal)
        TM.layer.cornerRadius = 0.5 * TM.bounds.size.width
        TM.clipsToBounds = true
        TM.backgroundColor = .black
        TM.addTarget(self, action: #selector(tmTapped), for: .touchUpInside)
        gameView.addSubview(TM)
        
        TR = UIButton(type: .custom)
        TR.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        TR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.minY)
        TR.setTitle("TR", for: .normal)
        TR.setTitleColor(.black, for: .normal)
        TR.layer.cornerRadius = 0.5 * TR.bounds.size.width
        TR.clipsToBounds = true
        TR.backgroundColor = .black
        TR.addTarget(self, action: #selector(trTapped), for: .touchUpInside)
        gameView.addSubview(TR)
        
        MR = UIButton(type: .custom)
        MR.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        MR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.midY)
        MR.setTitle("MR", for: .normal)
        MR.setTitleColor(.black, for: .normal)
        MR.layer.cornerRadius = 0.5 * MR.bounds.size.width
        MR.clipsToBounds = true
        MR.backgroundColor = .black
        MR.addTarget(self, action: #selector(mrTapped), for: .touchUpInside)
        gameView.addSubview(MR)
        
        BR = UIButton(type: .custom)
        BR.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        BR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.maxY)
        BR.setTitle("BR", for: .normal)
        BR.setTitleColor(.black, for: .normal)
        BR.layer.cornerRadius = 0.5 * BR.bounds.size.width
        BR.clipsToBounds = true
        BR.backgroundColor = .black
        BR.addTarget(self, action: #selector(brTapped), for: .touchUpInside)
        gameView.addSubview(BR)
    }
    
    func getCurrentPlayer() -> Player {
        if (p1.isTurn == true) {
            return p1
        } else {
            return p2
        }
    }
    
    @objc func tlTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
        
    }
    
    @objc func tmTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func trTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func mlTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func mmTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func mrTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func blTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    @objc func bmTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    
    @objc func brTapped(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            makeMove(position: buttonTitle, player: getCurrentPlayer())
        }
    }
    
    private func updateUI(position1: String, position2: String, player: Player) {
        switch position1 {
        case "TL":
            uiUpdate(btn: TL, player: player)
        case "BL":
            uiUpdate(btn: BL, player: player)
        case "ML":
            uiUpdate(btn: ML, player: player)
        case "MM":
            uiUpdate(btn: MM, player: player)
        case "TM":
            uiUpdate(btn: TM, player: player)
        case "BM":
            uiUpdate(btn: BM, player: player)
        case "TR":
            uiUpdate(btn: TR, player: player)
        case "MR":
            print("entered 1")
            uiUpdate(btn: MR, player: player)
        case "BR":
            uiUpdate(btn: BR, player: player)
        default:
            break
        }
        
        switch position2 {
        case "TL":
            uiUpdate(btn: TL, player: player)
        case "BL":
            uiUpdate(btn: BL, player: player)
        case "ML":
            uiUpdate(btn: ML, player: player)
        case "MM":
            uiUpdate(btn: MM, player: player)
        case "TM":
            uiUpdate(btn: TM, player: player)
        case "BM":
            uiUpdate(btn: BM, player: player)
        case "TR":
            print("entered 2")
            uiUpdate(btn: TR, player: player)
        case "MR":
            uiUpdate(btn: MR, player: player)
        case "BR":
            uiUpdate(btn: BR, player: player)
        default:
            break
        }
        
    }
    
    private func uiUpdate(btn: UIButton, player: Player) {
        
        DispatchQueue.main.async {
            if (btn.backgroundColor != .black) {
                print("pol")
                btn.backgroundColor = .black
                btn.setTitleColor(.black, for: .normal)
            } else {
                btn.backgroundColor = player.color
                btn.setTitleColor(player.color, for: .normal)
            }
            
        }
        
    }
    
    private func makeMove(position: String, player: Player) {
        
        if (count != 6 && count % 2 == 0 && isPositionOpen(position: position)) {
            let piece = Piece(currentPosition: position)
            p1.pieces.append(piece)
            updateUI(position1: position, position2: "", player: p1)
            count += 1
            return
        }
        
        if (count != 6 && count % 2 != 0 && isPositionOpen(position: position)) {
            let piece = Piece(currentPosition: position)
            p2.pieces.append(piece)
            updateUI(position1: position, position2: "", player: p2)
            count += 1
            return
        }
        
        gameArr.append(position)
        
        
        if (gameArr.count == 2) {
            print(gameArr!)
            if (isPositionOpen(position: gameArr[1]) && isMoveAllowed(currentPosition: gameArr[0], newPosition: gameArr[1])) {
                movePiece(player: player)
            } else {
                print("That position is not currently open punk")
            }
        }
    }
    
    func movePiece(player: Player) {
        var count = 0
        let pieces = player.pieces
        for piece in pieces {
            if (piece.currentPosition == gameArr[0]) {
                let result = piece.move(currentPosition: gameArr[0], newPosition: gameArr[1], p1: p1, p2: p2, index: count)
                updateUI(position1: gameArr[0], position2: gameArr[1], player: player)
                if (result) {
                    print("Game Won")
                }
                gameArr = []
                return
            }
            count += 1
        }
    }
    
    private func isMoveAllowed(currentPosition: String, newPosition: String) -> Bool {
        let pos = allowedMoves[currentPosition]!
        if (pos.contains(newPosition)) {
            return true
        }
        return false
    }
    
    
    
    private func isPositionOpen(position: String) -> Bool {
        let combinedArr = p1.pieces + p2.pieces
        if (combinedArr.count == 0) {
            return true
        } else {
            for piece in combinedArr {
                if (piece.currentPosition == position) {
                    return false
                }
            }
            return true
        }
    }
}

