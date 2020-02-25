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

class MainCoordinator: Coordinator, OrdersCoordinatorDelegate, OrderDetailsCoordinatorDelegate {
    var navigationController: UINavigationController
    let network: AlamofireNetwork?
    
    init(navigationController: UINavigationController, network: AlamofireNetwork?) {
        navigationController.isNavigationBarHidden = true
        self.navigationController = navigationController
        self.network = network
    }
    
    func start() {
        guard let ordersVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: OrdersViewController.self)) as? OrdersViewController else { return }
        if let alamofireNetwork = network {
            ordersVC.ordersService = OrdersService(network: alamofireNetwork)
        }
        ordersVC.delegate = self
        navigationController.pushViewController(ordersVC, animated: false)
    }
    
    func showOrderDetails(with order: Order) {
        guard let orderDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: OrderDetailsViewController.self)) as? OrderDetailsViewController else { return }
        orderDetailsVC.orderDetailViewModel = OrderDetailViewModel(order: order)
        if let alamofireNetwork = network {
            orderDetailsVC.orderDetailsService = OrderDetailsService(network: alamofireNetwork)
        }
        orderDetailsVC.delegate = self
        navigationController.pushViewController(orderDetailsVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
