//
//  Coordinator.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 11/15/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationViewController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationViewController: UINavigationController
    
    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }
    
    func start() {
        navigationViewController.delegate = self
        
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationViewController.pushViewController(viewController, animated: false)
    }
    
    func goToGame(game: Game) {
        let viewController = GameViewController(game: game)
        navigationViewController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate {}
