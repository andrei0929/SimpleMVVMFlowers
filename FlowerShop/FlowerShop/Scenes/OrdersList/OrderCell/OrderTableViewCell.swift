//
//  OrderTableViewCell.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier = "OrderTableViewCell"
    
    var order: OrderViewModel? {
        didSet {
            descriptionLabel.text = order?.description
            priceLabel.attributedText = order?.price
        }
    }
}
