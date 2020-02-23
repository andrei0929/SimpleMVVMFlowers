//
//  OrderDetailsService.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 23/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

enum ImageResponse {
    case success(UIImage)
    case failure(String)
}

class OrderDetailsService {
    let network = AlamofireNetwork.shared
    
    func getImage(with imageURL: URL, _ completion: @escaping (ImageResponse) -> Void) {
        network?.getImage(with: imageURL, completion: { result in
            switch result {
            case .success(let image):
                completion(.success(image ?? #imageLiteral(resourceName: "FlowerPlaceholder")))
            case .failure:
                completion(.failure("We encountered an error. Sorry for the inconvenience!"))
            }
        })
    }
}
