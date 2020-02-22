//
//  OrdersViewController.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModels: [OrderViewModel] = []
    
    let ordersService = OrdersService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: String(describing: OrderTableViewCell.self), bundle: nil), forCellReuseIdentifier: OrderTableViewCell.identifier)
        
        activityIndicator.startAnimating()
        ordersService.getAllOrders { [weak self] result in
            self?.activityIndicator.stopAnimating()
            switch result {
            case .success(let vms):
                self?.viewModels = vms
                self?.tableView.reloadData()
            case .failure(let errorMessage):
                let errorAlert = UIAlertController(title: errorMessage, message: nil, preferredStyle: .alert)
                self?.present(errorAlert, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    errorAlert.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        
        cell.order = viewModels[indexPath.row]
        return cell
    }
}
