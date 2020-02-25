//
//  Order.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Foundation

struct Order: Codable {
    let id: Int
    let price: Double
    let description: String
    let address: String
    let deliverTo: String
    let bouquetImage: String
    
    enum CodingKeys: String, CodingKey {
        case id, price, address, description
        case deliverTo = "deliver_to"
        case bouquetImage = "flower_image"
    }
}
