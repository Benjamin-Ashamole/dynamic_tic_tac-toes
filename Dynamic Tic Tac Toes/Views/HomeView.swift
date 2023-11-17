//
//  HomeView.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/15/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didStartGame(game: Game)
}

class HomeView: UIView {

    private var playerOneView = PlayerView()
    private var playerTwoView = PlayerView()
    
    private var alertView = UILabel()
    
    private let startButton = UIButton()
    
    weak var delegate: HomeViewDelegate? 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .link
        addSubviews()
        constrainSubviews()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(playerOneView)
        self.addSubview(playerTwoView)
        self.addSubview(startButton)
        self.addSubview(alertView)
    }
    
    private func configureSubviews() {
        playerOneView.translatesAutoresizingMaskIntoConstraints = false
        playerOneView.player.name = "Player One"
        playerOneView.player.color = .blue
        playerTwoView.translatesAutoresizingMaskIntoConstraints = false
        playerTwoView.player.name = "Player Two"
        playerTwoView.player.color = .red
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.layer.cornerRadius = 5
        alertView.numberOfLines = 0
        alertView.text = "Players cannot have the same color."
        alertView.textAlignment = .center
        alertView.isHidden = true
        alertView.alpha = 0
        alertView.font = UIFont(name: "Avenir Next", size: 25)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start Game", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        startButton.backgroundColor = .blue
        startButton.layer.cornerRadius = 5.0
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    private func constrainSubviews() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(playerOneView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20))
        constraints.append(playerOneView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20))
        constraints.append(playerOneView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35))
        constraints.append(playerOneView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15))
        
        constraints.append(playerTwoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20))
        constraints.append(playerTwoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20))
        constraints.append(playerTwoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35))
        constraints.append(playerTwoView.topAnchor.constraint(equalTo: playerOneView.bottomAnchor, constant: 15))
        
        constraints.append(startButton.widthAnchor.constraint(equalToConstant: 260))
        constraints.append(startButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50))
        
        constraints.append(alertView.topAnchor.constraint(equalTo: playerTwoView.bottomAnchor, constant: 40))
        constraints.append(alertView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20))
        constraints.append(alertView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func startGame() {
        
        if playerOneView.player.color == playerTwoView.player.color {
            UIView.animate(withDuration: 0.2) {
                self.alertView.alpha = 1
                self.alertView.isHidden = false
            }
            return
        }
        
        let game = Game(players: (playerOneView.player, playerTwoView.player))
        delegate?.didStartGame(game: game)
    }
    
}
