//
//  MainCoordinator.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol OrdersCoordinatorDelegate: class {
    func showOrderDetails(with order: Order)
}

class MainCoordinator: Coordinator, OrdersCoordinatorDelegate {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    lazy var mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    lazy var ordersVC = mainStoryboard.instantiateInitialViewController() as? OrdersViewController
    
    func start() {
        guard let ordersController = self.ordersVC else { return }
        ordersController.delegate = self
        navigationController.pushViewController(ordersController, animated: false)
    }
    
    func showOrderDetails(with order: Order) {
        guard let orderDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: OrderDetailsViewController.self)) as? OrderDetailsViewController else { return }
        orderDetailsVC.coordinator = self
        navigationController.pushViewController(orderDetailsVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
