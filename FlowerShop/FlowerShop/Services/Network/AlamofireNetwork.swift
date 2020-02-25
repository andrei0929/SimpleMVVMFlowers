//
//  AlamofireNetwork.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 22/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import Alamofire

class AlamofireNetwork {
    static var shared = AlamofireNetwork()
    
    let baseURL: String
    
    private init?() {
        let infoDictionary = Bundle.main.infoDictionary!
        guard let url = (infoDictionary["API_URL"] as? String)?.replacingOccurrences(of: "\\", with: "") else { return nil }
        baseURL = url
    }
    
    func getFlowerOrders(_ completion: @escaping (Result<[Order], Error>) -> Void) {
        doRequest(url: "\(baseURL)/orders") { result in
            switch result {
            case .success(let data):
                let orders: [Order] = (try? JSONDecoder().decode([Order].self, from: data)) ?? []
                completion(.success(orders))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getImageData(with imageURL: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        doRequest(url: imageURL) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func doRequest(url: URLConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url).response { response in
            guard response.error == nil else {
                completion(.failure(response.error!))
                return
            }
            
            guard let data = response.data else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                return
            }
            
            completion(.success(data))
        }
    }
}
