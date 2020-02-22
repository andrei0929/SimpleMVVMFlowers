//
//  OrdersService.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Foundation

enum OrdersResponse {
    case success([OrderViewModel])
    case failure(String)
}

class OrdersService {
    let network = AlamofireNetwork.shared
    
    func getAllOrders(_ completion: @escaping (OrdersResponse) -> Void) {
        network?.getFlowerOrders() { result in
            switch result {
            case .success(let orders):
                let vms = orders.map() { OrderViewModel($0) }
                completion(.success(vms))
            case .failure:
                completion(.failure("We encountered an error. Sorry for the inconvenience!"))
            }
        }
    }
}
