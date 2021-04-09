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
    
    var id = ""
    var thumb = ""
    var name = ""
    var _isFavourite = false
    
    var link : ListCollectionViewController?
    var favDelegate : favButtonDelegate?
    
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        favDelegate?.toggleFavourite(cellID: self.id)
    }

    
    
    func setupOutlets(drinkItem : Details?) {
        if drinkItem != nil{
            drinkImageView.loadImages(urlString: drinkItem!.strDrinkThumb)
            
            drinkLabel.text = drinkItem!.strDrink
            
            id = drinkItem!.idDrink
            name = drinkItem!.strDrink
            thumb = drinkItem!.strDrinkThumb
            
        } else {
            drinkImageView.image = .actions
            drinkLabel.text = "damn bro"
        }
    }
    
}

protocol favButtonDelegate {
    func toggleFavourite(cellID: String)
}
