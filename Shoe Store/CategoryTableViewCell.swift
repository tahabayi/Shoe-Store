//
//  CategoryTableViewCell.swift
//  Shoe Store
//
//  Created by Taha Bayi on 3.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var shoeCollection: UICollectionView!
    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var categoryItemCountLabel: UILabel!
    
    var categoryName: String = ""
    var categoryItems: [Shoe] = []
    
    let colorDict = [
        "black": UIColor.black,
        "red": UIColor.red,
        "orange": UIColor.orange,
        "yellow": UIColor.yellow,
        "green": UIColor.green,
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as! ShoeCollectionViewCell
        
        let shoe = categoryItems[indexPath.row]
        cell.shoeImage.image = UIImage(named: shoe.imageName)
        cell.priceLabel.text = "$"+"\(String(shoe.price))"
        cell.shoeTitleLabel.text = shoe.title
        
        cell.colorOptionsStackView.subviews.forEach({ $0.removeFromSuperview() })
        for colorOption in shoe.colorOptions {
            let colorView = UIView()
            colorView.backgroundColor = colorDict[colorOption]
            colorView.heightAnchor.constraint(equalToConstant: 12).isActive = true
            colorView.widthAnchor.constraint(equalToConstant: 12).isActive = true
            colorView.layer.cornerRadius = 4
            cell.colorOptionsStackView.addArrangedSubview(colorView)
        }
        
        // set cell backgroud for card-like appearance
        cell.contentView.layer.masksToBounds = true
        cell.layer.masksToBounds = false
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.backgroundColor = UIColor.white
        
        cell.layer.shadowRadius = 8.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cellSize = CGSize(width: collectionView.bounds.width-20, height: collectionView.bounds.height-20)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return sectionInset
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.shoeCollection.delegate = self
        self.shoeCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
