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
    var gameViewBorder = UIView()
    var gameView = UIView()
    let alertManager = AlertManager()
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
    var resetButton: UIButton!
    var curentButton: UIButton?
    
    var p1 = Player(name: "Player 1", color: .cyan, isTurn: true)
    var p2 = Player(name: "Player 2", color: .purple, isTurn: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.buildGameUI()
        }
        
    }
    
    func buildGameUI() {
        
        gameViewBorder.frame = CGRect(x: 23, y: 145, width: view.frame.size.width - 45, height: view.frame.size.height - 290)
        gameViewBorder.backgroundColor = .black
        view.addSubview(gameViewBorder)
        
        gameView = ViewWithDiagonalLine()
        gameView.frame = CGRect(x: 28, y: 150, width: view.frame.size.width - 55, height: view.frame.size.height - 300)
        gameView.backgroundColor = UIColor(named: "appBackgroundColor")
                   view.addSubview(gameView)
        
        TL = UIButton(type: .custom)
        TL.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        TL.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.minY)
        TL.setTitle("TL", for: .normal)
        TL.setTitleColor(.black, for: .normal)
        TL.layer.cornerRadius = 0.5 * TL.bounds.size.width
        TL.clipsToBounds = false
        TL.backgroundColor = .black
        TL.addTarget(self, action: #selector(tlTapped), for: .touchUpInside)
        TL.layer.zPosition = 0
        gameView.addSubview(TL)
        view.bringSubviewToFront(TL)
        
        BL = UIButton(type: .custom)
        BL.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        BL.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.maxY)
        BL.setTitle("BL", for: .normal)
        BL.setTitleColor(.black, for: .normal)
        BL.layer.cornerRadius = 0.5 * BL.bounds.size.width
        BL.clipsToBounds = true
        BL.backgroundColor = .black
        BL.addTarget(self, action: #selector(blTapped), for: .touchUpInside)
        BL.layer.zPosition = 0
        gameView.addSubview(BL)
        view.bringSubviewToFront(BL)
        
        ML = UIButton(type: .custom)
        ML.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        ML.center = CGPoint(x: gameView.bounds.minX, y: gameView.bounds.midY)
        ML.setTitle("ML", for: .normal)
        ML.setTitleColor(.black, for: .normal)
        ML.layer.cornerRadius = 0.5 * ML.bounds.size.width
        ML.clipsToBounds = true
        ML.backgroundColor = .black
        ML.addTarget(self, action: #selector(mlTapped), for: .touchUpInside)
        ML.layer.zPosition = 0
        gameView.addSubview(ML)
        view.bringSubviewToFront(ML)
        
        MM = UIButton(type: .custom)
        MM.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        MM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.midY)
        MM.setTitle("MM", for: .normal)
        MM.setTitleColor(.black, for: .normal)
        MM.layer.cornerRadius = 0.5 * MM.bounds.size.width
        MM.clipsToBounds = true
        MM.backgroundColor = .black
        MM.addTarget(self, action: #selector(mmTapped), for: .touchUpInside)
        MM.layer.zPosition = 0
        gameView.addSubview(MM)
        
        BM = UIButton(type: .custom)
        BM.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        BM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.maxY)
        BM.setTitle("BM", for: .normal)
        BM.setTitleColor(.black, for: .normal)
        BM.layer.cornerRadius = 0.5 * BM.bounds.size.width
        BM.clipsToBounds = true
        BM.backgroundColor = .black
        BM.addTarget(self, action: #selector(bmTapped), for: .touchUpInside)
        BM.layer.zPosition = 1
        gameView.addSubview(BM)
        
        TM = UIButton(type: .custom)
        TM.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        TM.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.minY)
        TM.setTitle("TM", for: .normal)
        TM.setTitleColor(.black, for: .normal)
        TM.layer.cornerRadius = 0.5 * TM.bounds.size.width
        TM.clipsToBounds = true
        TM.backgroundColor = .black
        TM.addTarget(self, action: #selector(tmTapped), for: .touchUpInside)
        TM.layer.zPosition = 1
        gameView.addSubview(TM)
        
        TR = UIButton(type: .custom)
        TR.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        TR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.minY)
        TR.setTitle("TR", for: .normal)
        TR.setTitleColor(.black, for: .normal)
        TR.layer.cornerRadius = 0.5 * TR.bounds.size.width
        TR.clipsToBounds = true
        TR.backgroundColor = .black
        TR.addTarget(self, action: #selector(trTapped), for: .touchUpInside)
        TR.layer.zPosition = 1
        gameView.addSubview(TR)
        
        MR = UIButton(type: .custom)
        MR.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        MR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.midY)
        MR.setTitle("MR", for: .normal)
        MR.setTitleColor(.black, for: .normal)
        MR.layer.cornerRadius = 0.5 * MR.bounds.size.width
        MR.clipsToBounds = true
        MR.backgroundColor = .black
        MR.addTarget(self, action: #selector(mrTapped), for: .touchUpInside)
        MR.layer.zPosition = 1
        gameView.addSubview(MR)
        
        BR = UIButton(type: .custom)
        BR.frame = CGRect(x: 160, y: 100, width: 70, height: 70)
        BR.center = CGPoint(x: gameView.bounds.maxX, y: gameView.bounds.maxY)
        BR.setTitle("BR", for: .normal)
        BR.setTitleColor(.black, for: .normal)
        BR.layer.cornerRadius = 0.5 * BR.bounds.size.width
        BR.clipsToBounds = true
        BR.backgroundColor = .black
        BR.addTarget(self, action: #selector(brTapped), for: .touchUpInside)
        BR.layer.zPosition = 1
        gameView.addSubview(BR)
        
        resetButton = UIButton(type: .custom)
        resetButton.frame = CGRect(x: 0, y: 0, width: 250, height: 60)
        resetButton.center = CGPoint(x: view.bounds.midX, y: view.bounds.maxY - 70)
        resetButton.backgroundColor = .systemIndigo
        resetButton.layer.cornerRadius = 5
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
        view.addSubview(resetButton)
        
        view.sendSubviewToBack(gameViewBorder)
    }
    
    func getCurrentPlayer() -> Player {
        if (p1.isTurn == true) {
            return p1
        } else {
            return p2
        }
    }
    
    @objc func tlTapped(_ sender: UIButton) {
        view.bringSubviewToFront(TL)
        
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func tmTapped(_ sender: UIButton) {
        view.bringSubviewToFront(TL)
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func trTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func mlTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func mmTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func mrTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func blTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    @objc func bmTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
    }
    
    
    @objc func brTapped(_ sender: UIButton) {
        makeMove(position: sender, player: getCurrentPlayer())
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
                
                btn.backgroundColor = .black
                btn.setTitleColor(.black, for: .normal)
            } else {
                btn.backgroundColor = player.color
                btn.setTitleColor(player.color, for: .normal)
            }
            
        }
        
    }
    
    private func makeMove(position: UIButton, player: Player) {
        
        let pos = position.title(for: .normal)!
        
        if (count != 6 && count % 2 == 0 && isPositionOpen(position: pos)) {
            let piece = Piece(currentPosition: pos)
            p1.pieces.append(piece)
            updateUI(position1: pos, position2: "", player: p1)
            count += 1
            return
        }
        
        if (count != 6 && count % 2 != 0 && isPositionOpen(position: pos)) {
            let piece = Piece(currentPosition: pos)
            p2.pieces.append(piece)
            updateUI(position1: pos, position2: "", player: p2)
            count += 1
            return
        }
        
        if count != 6 {
            return
        }
        gameArr.append(pos)
        if (gameArr.count == 1) {
            let currentArr = player.pieces.map { piece in
                piece.currentPosition
            }
            
            if (currentArr.contains(pos)) {
                position.layer.borderWidth = 4
                position.layer.borderColor = UIColor.green.cgColor
                curentButton = position
            } else {
                print("It not your turn")
                gameArr = []
            }
            
        }
        
        if (gameArr.count == 2) {
            print(gameArr!)
            
            if (gameArr[0] == gameArr[1]) {
                gameArr = []
                position.layer.borderWidth = 0
                return
            }
            if (isPositionOpen(position: gameArr[1]) && isMoveAllowed(currentPosition: gameArr[0], newPosition: gameArr[1])) {
                movePiece(player: player)
                curentButton?.layer.borderWidth = 0
                curentButton?.layer.borderColor = player.color.cgColor
                return
            } else {
                print("That position is not currently open punk")
                gameArr = []
            }
        }
    }
    
    @objc func dismissAlert() {
        alertManager.dismissAlert()
      //  reset()
    }
    
    @objc func reset() {
        
        DispatchQueue.main.async {
            self.BL.backgroundColor = .black
            self.BL.setTitleColor(.black, for: .normal)
            self.ML.backgroundColor = .black
            self.ML.setTitleColor(.black, for: .normal)
            self.BR.backgroundColor = .black
            self.BR.setTitleColor(.black, for: .normal)
            self.MM.backgroundColor = .black
            self.MM.setTitleColor(.black, for: .normal)
            self.MR.backgroundColor = .black
            self.MR.setTitleColor(.black, for: .normal)
            self.TL.backgroundColor = .black
            self.TL.setTitleColor(.black, for: .normal)
            self.BM.backgroundColor = .black
            self.BM.setTitleColor(.black, for: .normal)
            self.TM.backgroundColor = .black
            self.TM.setTitleColor(.black, for: .normal)
            self.TR.backgroundColor = .black
            self.TR.setTitleColor(.black, for: .normal)
        }
        
        gameArr = []
        p1.isTurn = true
        p2.isTurn = false
        p1.pieces = []
        p2.pieces = []
        count = 0
        
    }
    
    func movePiece(player: Player) {
        var count = 0
        let pieces = player.pieces
        for piece in pieces {
            if (piece.currentPosition == gameArr[0]) {
                let result = piece.move(currentPosition: gameArr[0], newPosition: gameArr[1], p1: p1, p2: p2, index: count)
               // DispatchQueue.main.async {
                self.updateUI(position1: self.gameArr[0], position2: self.gameArr[1], player: player)
                //}
                
                if (result) {
                    alertManager.showAlert(with: "Player 1 has won the game", message: "Player 2 you sorry ass bitch. Player 1 done whooped your lil sorry ass. ", on: self)
                    reset()
                    return
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

