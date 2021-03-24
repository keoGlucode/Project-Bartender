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
    
    @IBOutlet weak var drinkInstructions: UILabel!
    
    @IBOutlet weak var drinkImage: UIImageView!
    
    var drinks = CocktailsManager()
    var drinkID = ""
    var drink_Image = ""
    var drinkName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drinks.performDrinksAttributesRequest(stringAppend: drinkID, completed: setLabels)
        
        
    }
    
    
    
    func setLabels() {
        drinkLabel.text = drinkName
        drinkImage.loadImages(urlString: drink_Image)
    }

    
}
