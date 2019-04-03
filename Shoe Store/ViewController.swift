//
//  ViewController.swift
//  Shoe Store
//
//  Created by Taha Bayi on 3.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let categories = [
        ["category": "Category 1", "items": [
            Shoe(price: 86.99, title: "Men's casual runners", imageName: "adidas_black", colorOptions: ["orange", "red", "yellow"], sizeOptions: [41, 42, 43, 44, 45]),
            Shoe(price: 93.99, title: "Men's daily sneakers", imageName: "adidas_red", colorOptions: ["green", "black"], sizeOptions: [41, 42, 43, 44, 45]),
            ]
        ],
        ["category": "Category 2", "items": [
            Shoe(price: 78.99, title: "Women's casual runners", imageName: "adidas_red", colorOptions: ["green", "yellow"], sizeOptions: [41, 42, 43, 44, 45]),
            Shoe(price: 89.99, title: "Women's daily sneakers", imageName: "adidas_black", colorOptions: ["black", "orange", "red"], sizeOptions: [41, 42, 43, 44, 45]),
            ]
        ],
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        
        let categoryName = categories[indexPath.row]["category"] as! String
        let categoryItems = categories[indexPath.row]["items"] as! [Shoe]
        
        cell.categoryName = categoryName
        cell.categoryItems = categoryItems
        
        cell.categoryButton.setTitle(categoryName, for: .normal)
        cell.categoryItemCountLabel.text = String(categoryItems.count)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

