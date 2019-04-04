//
//  HighlightedUIButton.swift
//  Shoe Store
//
//  Created by Taha Bayi on 4.04.2019.
//  Copyright © 2019 yupana. All rights reserved.
//

import UIKit

class HighlightedUIButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIButton.animate(withDuration: 0.2, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.96, y: 0.94)
                })
            } else {
                UIButton.animate(withDuration: 0.2, animations: {
                    self.transform = .identity
                })
            }
        }
    }

}
