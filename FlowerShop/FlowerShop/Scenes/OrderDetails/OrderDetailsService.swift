//
//  OrderDetailsService.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

class OrderDetailsService {
    let network: AlamofireNetwork
    
    init(network: AlamofireNetwork) {
        self.network = network
    }
    
    func getImage(with imageURL: String, _ completion: @escaping (ImageViewModel) -> Void) {
        network.getImageData(with: imageURL, completion: { result in
            switch result {
            case .success(let data):
                completion(ImageViewModel(data: data))
            case .failure:
                completion(ImageViewModel(data: nil))
            }
        })
    }
}
