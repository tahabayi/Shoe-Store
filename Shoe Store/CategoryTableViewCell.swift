//
//  CategoryTableViewCell.swift
//  Shoe Store
//
//  Created by Taha Bayi on 3.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Properties
    
    @IBOutlet var shoeCollection: UICollectionView!
    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var categoryItemCountLabel: UILabel!
    
    var categoryName: String?
    var categoryItems: [Shoe] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set delegate and datesource for shoe collection view
        self.shoeCollection.delegate = self
        self.shoeCollection.dataSource = self
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UICollectionViewCell.animate(withDuration: 0.2, animations: {
            cell?.contentView.transform = CGAffineTransform(scaleX: 0.96, y: 0.94)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UICollectionViewCell.animate(withDuration: 0.2, animations: {
            cell?.contentView.transform = .identity
        })
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as! ShoeCollectionViewCell
        
        let shoe = categoryItems[indexPath.row]
        cell.shoeImage.image = UIImage(named: shoe.imageName)
        cell.priceLabel.text = "$"+"\(String(shoe.price))"
        cell.shoeTitleLabel.text = shoe.title
        
        // remove old color options and add new ones
        cell.colorOptionsStackView.subviews.forEach({ $0.removeFromSuperview() })
        for colorOption in shoe.colorOptions {
            let colorView = UIView()
            colorView.backgroundColor = Constants.colorDict[colorOption]
            colorView.heightAnchor.constraint(equalToConstant: 12).isActive = true
            colorView.widthAnchor.constraint(equalToConstant: 12).isActive = true
            colorView.layer.cornerRadius = 4
            cell.colorOptionsStackView.addArrangedSubview(colorView)
        }
        
        // set cell backgroud for card-like appearance
        cell.addCardAppearence()
        
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
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

}

