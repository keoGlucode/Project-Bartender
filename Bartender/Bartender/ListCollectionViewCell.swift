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
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBAction func didTapOnButton(_ sender: UIButton) {
        setFavourite()
    }
    
    func setFavourite() {
        if(_isFavourite == false) {
            self._isFavourite = true
            self.favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            favourites.append(FavouriteItem(idDrink: id, strDrink: name, strDrinkThumb: thumb, isFave: true))
            //print("fill")
            link?.changeCellStatus(cell: self)
        } else {
            self._isFavourite = false
            self.favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            print(favourites)
            //print("mxm")
            link?.changeCellStatus(cell: self)
            
            
        }
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
