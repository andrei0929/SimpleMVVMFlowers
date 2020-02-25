//
//  ImageViewModel.swift
//  FlowerShop
//
//  Created by Andrei Oltean on 25/02/2020.
//  Copyright © 2020 Andrei Oltean. All rights reserved.
//

import UIKit

struct ImageViewModel {
    let image: UIImage
    
    init(data: Data?) {
        if let imageData = data {
            image = UIImage(data: imageData) ?? #imageLiteral(resourceName: "FlowerPlaceholder")
        } else {
            image = #imageLiteral(resourceName: "FlowerPlaceholder")
        }
    }
}
