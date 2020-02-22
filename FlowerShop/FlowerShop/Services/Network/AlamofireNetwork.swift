//
//  AlamofireNetwork.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetwork {
    static var shared = AlamofireNetwork()
    
    let baseURL: String
    
    init?() {
        let infoDictionary = Bundle.main.infoDictionary!
        guard let url = (infoDictionary["API_URL"] as? String)?.replacingOccurrences(of: "\\", with: "") else { return nil }
        baseURL = url
    }
    
    func getFlowerOrders(_ completion: @escaping (Result<[Order], Error>) -> Void) {
        AF.request("\(baseURL)/orders", method: .get).response { response in
            guard response.error == nil else {
                completion(.failure(response.error!))
                return
            }
            
            guard let data = response.data else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                return
            }
            let orders: [Order] = (try? JSONDecoder().decode([Order].self, from: data)) ?? []
            completion(.success(orders))
        }
    }
}
