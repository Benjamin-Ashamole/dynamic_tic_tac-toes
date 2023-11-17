//
//  GameViewController.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/8/23.
//

import UIKit

typealias Node = UIButton

class GameViewController: UIViewController {
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var TL = UIButton()
    private var ML = UIButton()
    private var BL = UIButton()
    private var TM = UIButton()
    private var MM = UIButton()
    private var BM = UIButton()
    private var TR = UIButton()
    private var MR = UIButton()
    private var BR = UIButton()
    
    private var frameBorder = UIView()
    
    private var frameView = ViewWithDiagonalLine()
    
    private var nodes = [UIButton]()
    
    private var currentGame = Game()
    
    private var alertManager = AlertManager()
    
    private var playerOne = Player()
    private var playerTwo = Player()
    
    init(game: Game) {
        super.init(nibName: nil, bundle: nil)
        self.currentGame = game
        handleGameInit()
        handleNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func handleGameInit() {
        title = currentGame.title ?? "Battle of the Bastards"
        view.backgroundColor = .link
        nodes = [TL, ML, BL, TM, MM, BM, TR, MR, BR]
        setupLines()
        setupNodes()
        setupResetButton()
        setupPlayers()
    }
    
    private func setupNodes() {
        configureNodes()
        addNodes()
        constrainNodes()
    }
    
    private func setupResetButton() {
        configureResetButton()
        addResetButton()
        constrainResetButton()
    }
    
    private func constrainResetButton() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100))
        constraints.append(resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100))
        constraints.append(resetButton.topAnchor.constraint(equalTo: frameView.bottomAnchor, constant: 40))
        constraints.append(resetButton.heightAnchor.constraint(equalToConstant: 60))
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func handleNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(resetGame), name: NSNotification.Name("reset"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("reset"), object: nil)
    }
    
    private func addResetButton() {
        view.addSubview(resetButton)
    }
    
    private func configureResetButton() {
        resetButton.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
    }
    
    private func configureNodes() {
        
        TL.setTitle("TL", for: .normal)
        TL.addTarget(self, action: #selector(tlTapped), for: .touchUpInside)
        
        ML.setTitle("ML", for: .normal)
        ML.addTarget(self, action: #selector(mlTapped), for: .touchUpInside)
        
        BL.setTitle("BL", for: .normal)
        BL.addTarget(self, action: #selector(blTapped), for: .touchUpInside)
        
        TM.setTitle("TM", for: .normal)
        TM.addTarget(self, action: #selector(tmTapped), for: .touchUpInside)
        
        MM.setTitle("MM", for: .normal)
        MM.addTarget(self, action: #selector(mmTapped), for: .touchUpInside)
        
        BM.setTitle("BM", for: .normal)
        BM.addTarget(self, action: #selector(bmTapped), for: .touchUpInside)
        
        TR.setTitle("TR", for: .normal)
        TR.addTarget(self, action: #selector(trTapped), for: .touchUpInside)
        
        MR.setTitle("MR", for: .normal)
        MR.addTarget(self, action: #selector(mrTapped), for: .touchUpInside)
        
        BR.setTitle("BR", for: .normal)
        BR.addTarget(self, action: #selector(brTapped), for: .touchUpInside)
        
        nodes.forEach { node in
            node.layer.cornerRadius = 30
            node.setTitleColor(.black, for: .normal)
            node.translatesAutoresizingMaskIntoConstraints = false
            node.backgroundColor = .black
        }
    }
    
    private func constrainNodes() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(TL.centerXAnchor.constraint(equalTo: frameView.leadingAnchor))
        constraints.append(TL.centerYAnchor.constraint(equalTo: frameView.topAnchor))
        constraints.append(TL.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(TL.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(ML.centerXAnchor.constraint(equalTo: frameView.leadingAnchor))
        constraints.append(ML.centerYAnchor.constraint(equalTo: frameView.centerYAnchor))
        constraints.append(ML.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(ML.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(BL.centerXAnchor.constraint(equalTo: frameView.leadingAnchor))
        constraints.append(BL.centerYAnchor.constraint(equalTo: frameView.bottomAnchor))
        constraints.append(BL.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(BL.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(TM.centerXAnchor.constraint(equalTo: frameView.centerXAnchor))
        constraints.append(TM.centerYAnchor.constraint(equalTo: frameView.topAnchor))
        constraints.append(TM.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(TM.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(MM.centerXAnchor.constraint(equalTo: frameView.centerXAnchor))
        constraints.append(MM.centerYAnchor.constraint(equalTo: frameView.centerYAnchor))
        constraints.append(MM.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(MM.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(BM.centerXAnchor.constraint(equalTo: frameView.centerXAnchor))
        constraints.append(BM.centerYAnchor.constraint(equalTo: frameView.bottomAnchor))
        constraints.append(BM.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(BM.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(TR.centerXAnchor.constraint(equalTo: frameView.trailingAnchor))
        constraints.append(TR.centerYAnchor.constraint(equalTo: frameView.topAnchor))
        constraints.append(TR.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(TR.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(MR.centerXAnchor.constraint(equalTo: frameView.trailingAnchor))
        constraints.append(MR.centerYAnchor.constraint(equalTo: frameView.centerYAnchor))
        constraints.append(MR.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(MR.widthAnchor.constraint(equalToConstant: 60))
        
        constraints.append(BR.centerXAnchor.constraint(equalTo: frameView.trailingAnchor))
        constraints.append(BR.centerYAnchor.constraint(equalTo: frameView.bottomAnchor))
        constraints.append(BR.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(BR.widthAnchor.constraint(equalToConstant: 60))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addNodes() {
        view.addSubview(TL)
        view.addSubview(BL)
        view.addSubview(ML)
        view.addSubview(TM)
        view.addSubview(MM)
        view.addSubview(BM)
        view.addSubview(TR)
        view.addSubview(MR)
        view.addSubview(BR)
    }
    
    private func setupLines() {
        addLinesAsSubviews()
        setupGameFrame()
        constrainLines()
    }
    
    private func setupPlayers() {
        playerOne = currentGame.players.playerOne
        playerOne.isTurn = true
        playerTwo = currentGame.players.playerTwo
    }
    
    private func setupGameFrame() {
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameBorder.translatesAutoresizingMaskIntoConstraints = false
        
        frameBorder.backgroundColor = .black
        frameView.backgroundColor = .link
    }
    
    private func addLinesAsSubviews() {
        view.addSubview(frameBorder)
        view.addSubview(frameView)
    }
    
    private func constrainLines() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(frameBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
        constraints.append(frameBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
        constraints.append(frameBorder.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(frameBorder.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(frameBorder.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7))
        
        constraints.append(frameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35))
        constraints.append(frameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35))
        constraints.append(frameView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(frameView.topAnchor.constraint(equalTo: frameBorder.topAnchor, constant: 5))
        constraints.append(frameView.bottomAnchor.constraint(equalTo: frameBorder.bottomAnchor, constant: -5))
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension GameViewController {
    @objc func tlTapped() {
        play(node: TL, currentPlayer: getCurrentPlayer())
    }
    
    @objc func blTapped() {
        play(node: BL, currentPlayer: getCurrentPlayer())
    }
    
    @objc func mlTapped() {
        play(node: ML, currentPlayer: getCurrentPlayer())
    }
    
    @objc func mmTapped() {
        play(node: MM, currentPlayer: getCurrentPlayer())
    }
    
    @objc func bmTapped() {
        play(node: BM, currentPlayer: getCurrentPlayer())
    }
    
    @objc func tmTapped() {
        play(node: TM, currentPlayer: getCurrentPlayer())
    }
    
    @objc func trTapped() {
        play(node: TR, currentPlayer: getCurrentPlayer())
    }
    
    @objc func mrTapped() {
        play(node: MR, currentPlayer: getCurrentPlayer())
    }
    
    @objc func brTapped() {
        play(node: BR, currentPlayer: getCurrentPlayer())
    }
    
    private func getCurrentPlayer() -> Player {
        if playerOne.isTurn { return playerOne }
        return playerTwo
    }
}

extension GameViewController {
    
    private func play(node: Node, currentPlayer: Player) {
        switch currentGame.gamePhase {
        case .mounting:
            handleMounting(at: node, player: currentPlayer)
        case .inPlay:
            handleInPlay(at: node, player: currentPlayer)
        }
    }
    
    private func handleMounting(at node: Node, player: Player) {
        
        guard let position = node.title(for: .normal) else { return }
        
        if positionIsAvailable(position: position) {
            let piece = Piece(currentPosition: position)
            player.pieces.append(piece)
            assignTurn(isTurn: player.isTurn)
            updateGamePhase()
            handleUIUpdate(position1: position, player: player)
            checkForWin(player: player)
        } else {
            UIView.animate(withDuration: 0.2) {
                node.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } completion: { didFinish in
                node.transform = .identity
            }
        }
        
    }
    
    private func updateGamePhase() {
        if playerOne.pieces.count == 3 && playerTwo.pieces.count == 3 {
            currentGame.gamePhase = .inPlay
        }
    }
    
    private func assignTurn(isTurn: Bool) {
        playerOne.isTurn = !isTurn
    }
    
    private func handleInPlay(at node: Node, player: Player) {
        
        guard let position = node.title(for: .normal) else { return }
        
        if let _ = player.movePosition.current {
            handlePieceMove(for: node, player: player)
            
        } else {
            
            let piecesList = player.pieces.map { piece in
                piece.currentPosition
            }
            
            if piecesList.contains(position) {
                node.layer.borderWidth = 4
                node.layer.borderColor = UIColor.green.cgColor
                player.movePosition.current = position
                currentGame.currentNode = node
            } else {
                print("It not your turn")
            }
        }
        
    }
    
    private func handlePieceMove(for node: Node, player: Player) {
        guard 
            let position = node.title(for: .normal),
            let currentPosition = player.movePosition.current else { return }
        
        if position == currentPosition {
            player.movePosition.current = nil
            player.movePosition.next = nil
            node.layer.borderWidth = 0
            return
        }
        
        player.movePosition.next = position
        
        if positionIsAvailable(position: player.movePosition.next ?? "") &&
            moveIsAllowed(currentPosition: player.movePosition.current ?? "", nextPosition: player.movePosition.next ?? "") {
            currentGame.currentNode?.layer.borderWidth = 0
            currentGame.currentNode?.layer.borderColor = UIColor.black.cgColor
            movePiece(for: player)
        } else {
            player.movePosition.current = nil
            player.movePosition.next = nil
            // Notify that the position they're trying to move to is not allowed at the current game state.
        }
        
    }
    
    private func movePiece(for player: Player) {
        
        guard let current = player.movePosition.current, let next = player.movePosition.next else { return }
        
        let pieces = player.pieces
        
        for piece in pieces {
            if piece.currentPosition == current {
                piece.movePiece(for: player)
                handleUIUpdate(position1: current, position2: next, player: player)
            }
        }
        
        playerOne.isTurn = !playerOne.isTurn
        player.movePosition.current = nil
        player.movePosition.next = nil
        
        checkForWin(player: player)
    }
    
    private func checkForWin(player: Player) {
        let gameIsWon = currentGame.checkForWin(playerArr: player.pieces)
        if gameIsWon {
            alertManager.showAlert(with: "Winner Winner Chicken Dinner",
                                   message: "\(player.name) wins the game",
                                   on: self)
          //  self.resetGame()
        }
    }
    
    @objc private func resetGame() {
        playerOne.pieces = []
        playerOne.isTurn = true
        
        playerTwo.pieces = []
        playerTwo.isTurn = false
        
        DispatchQueue.main.async {
            for node in self.nodes {
                node.setTitleColor(.black, for: .normal)
                node.backgroundColor = .black
            }
        }
        
        let game = Game(title: currentGame.title ?? "Battle of the Bastards", players: (currentGame.players.playerOne, currentGame.players.playerTwo))
        
         currentGame = game
        
        
        
        

    }
    
    private func positionIsAvailable(position: String) -> Bool {
        
        let pieces = playerOne.pieces + playerTwo.pieces
        
        if (pieces.count == 0) { return true }
        
        for piece in pieces {
            if piece.currentPosition == position { return false }
        }
        return true
    }
    
    private func moveIsAllowed(currentPosition: String, nextPosition: String) -> Bool {
        let allowedMovesForCurrentPosition = Rules.allowedMoves[currentPosition] ?? []
        if (allowedMovesForCurrentPosition.contains(nextPosition)) {
            return true
        }
        return false
    }
    
    private func handleUIUpdate(position1: String, position2: String = "", player: Player) {
        switch position1 {
        case "TL": performUIUpdate(node: TL, player: player)
        case "BL": performUIUpdate(node: BL, player: player)
        case "ML": performUIUpdate(node: ML, player: player)
        case "MM": performUIUpdate(node: MM, player: player)
        case "TM": performUIUpdate(node: TM, player: player)
        case "BM": performUIUpdate(node: BM, player: player)
        case "TR": performUIUpdate(node: TR, player: player)
        case "MR": performUIUpdate(node: MR, player: player)
        case "BR": performUIUpdate(node: BR, player: player)
        default: break
        }
        
        switch position2 {
        case "TL": performUIUpdate(node: TL, player: player)
        case "BL": performUIUpdate(node: BL, player: player)
        case "ML": performUIUpdate(node: ML, player: player)
        case "MM": performUIUpdate(node: MM, player: player)
        case "TM": performUIUpdate(node: TM, player: player)
        case "BM": performUIUpdate(node: BM, player: player)
        case "TR": performUIUpdate(node: TR, player: player)
        case "MR": performUIUpdate(node: MR, player: player)
        case "BR": performUIUpdate(node: BR, player: player)
        default: break
        }
    }
    
    private func performUIUpdate(node: Node, player: Player) {
        DispatchQueue.main.async {
            self.currentGame.currentNode?.backgroundColor = .black
            self.currentGame.currentNode?.setTitleColor(.black, for: .normal)
            
            node.backgroundColor = player.color
            node.setTitleColor(player.color, for: .normal)
        }
    }
}
