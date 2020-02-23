//
//  OrderDetailsViewController.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        coordinator?.goBack()
    }
}
