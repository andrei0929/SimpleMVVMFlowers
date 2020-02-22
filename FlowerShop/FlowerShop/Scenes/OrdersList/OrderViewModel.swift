//
//  OrderViewModel.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Foundation
import UIKit

struct OrderViewModel {
    let description: String
    let price: NSAttributedString
    
    init(_ order: Order) {
        description = order.description
        price = NSAttributedString(string: String(format: "%.2lf", order.price), attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 10)])
    }
}
