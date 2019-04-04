//
//  ShoeCollectionViewCell.swift
//  Shoe Store
//
//  Created by Taha Bayi on 3.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var shoeImage: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var shoeTitleLabel: UILabel!
    @IBOutlet var colorOptionsStackView: UIStackView!
    
    func addCardAppearence(){
        self.contentView.layer.masksToBounds = true
        self.layer.masksToBounds = false
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.backgroundColor = UIColor.white
        
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
}
