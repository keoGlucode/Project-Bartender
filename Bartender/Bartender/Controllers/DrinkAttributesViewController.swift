//
//  DrinkAttributesViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/17.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class DrinkAttributesViewController: UIViewController {
    
    @IBOutlet weak var drinkLabel: UILabel!
    
    
    @IBOutlet weak var drinkImage: UIImageView!
    
    var drinks = CocktailsManager()
    var drinkID = "11007"
    var drink_Image = UIImage()
    var drinkName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinks.performDrinksAttributesRequest(stringAppend: drinkID, completed: setLabels)
        
        drinkLabel.text = drinkName
        drinkImage.image = drink_Image
    }
    
    
    
    func setLabels() {
        print("setting labels")
    }

    
}
