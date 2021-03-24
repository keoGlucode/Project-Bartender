//
//  DrinkDetailsViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/24.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class DrinkDetailsViewController: UIViewController {
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    var serviceCall = CocktailsManager()
    var drinkID = ""
    var drink_Image = ""
    var drinkName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        serviceCall.performDrinksAttributesRequest(stringAppend: drinkID, completed: setLabels)
    }
    
    
    func setLabels() {
        drinkNameLabel.text = drinkName
        drinkImage.loadImages(urlString: drink_Image)
        
        print(serviceCall.drinksDetails)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
