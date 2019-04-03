//
//  Shoe.swift
//  Shoe Store
//
//  Created by Taha Bayi on 3.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import Foundation

class Shoe {
    var price: Float
    var title: String
    var imageName: String
    var colorOptions: [String]
    var sizeOptions: [Int]
    
    init(price: Float, title:String, imageName: String, colorOptions: [String], sizeOptions: [Int]) {
        self.price = price
        self.title = title
        self.imageName = imageName
        self.colorOptions = colorOptions
        self.sizeOptions = sizeOptions
    }
}
