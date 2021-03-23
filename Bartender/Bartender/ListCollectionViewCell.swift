//
//  ListCollectionViewCell.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/19.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    
    @IBOutlet weak var drinkLabel: UILabel!
    
    func setupOutlets(drinkItem : Details?) {
        if drinkItem != nil{
            drinkImageView.loadImages(urlString: drinkItem!.strDrinkThumb)
            
            drinkLabel.text = drinkItem?.strDrink
        } else {
            drinkImageView.image = .actions
            drinkLabel.text = "damn bro"
        }
    }
}
