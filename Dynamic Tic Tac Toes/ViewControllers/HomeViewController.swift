//
//  HomeViewController.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/15/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let contentView = HomeView()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        contentView.delegate = self
    }
    
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func didStartGame(game: Game) {
        coordinator?.goToGame(game: game)
    }
}
