//
//  OrderDetailsViewController.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var flowersImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addresserLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var delegate: OrderDetailsCoordinatorDelegate?
    
    var orderDetailViewModel: OrderDetailViewModel?
    var orderDetailsService: OrderDetailsService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = orderDetailViewModel?.description
        addresserLabel.text = orderDetailViewModel?.addresser
        addressLabel.text = orderDetailViewModel?.address
        flowersImageView.image = #imageLiteral(resourceName: "FlowerPlaceholder")
        
        if let imageURL = orderDetailViewModel?.imageURL {
            orderDetailsService?.getImage(with: imageURL) { [weak self] imageViewModel in
                self?.flowersImageView.image = imageViewModel.image
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        titleLabel.layer.cornerRadius = 6
        backButton.layer.cornerRadius = 6
    }
    
    @IBAction func goBack(_ sender: Any) {
        delegate?.goBack()
    }
}
