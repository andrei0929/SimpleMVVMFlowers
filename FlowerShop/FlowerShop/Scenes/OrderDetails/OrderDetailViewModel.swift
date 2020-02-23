//
//  OrderDetailViewModel.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Foundation

struct OrderDetailViewModel {
    let description: String
    let addresser: String
    let address: String
    let imageURL: URL?
    
    init(order: Order) {
        description = order.description
        addresser = order.deliverTo
        address = order.address
        imageURL = URL(string: order.bouquetImage)
    }
}
