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
    
    @IBAction func didTapShareButton(_ sender: UIButton) {
        
        presentShareSheet()
        print("Tapped button")
        
    }
    
    var serviceCall = CocktailsManager()
    var drinkID = ""
    var drink_Image = ""
    var drinkName = String()
    
    let loadingViewController = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoadingIndicator()
        
        serviceCall.performDrinksAttributesRequest(stringAppend: drinkID, completed: setLabels)
    }
    
    
    func setLabels() {
        drinkNameLabel.text = drinkName
        drinkImage.loadImages(urlString: drink_Image)
        
        alcoholLabel.text = serviceCall.drinksDetails[0].strAlcoholic
        instructionsLabel.text = serviceCall.drinksDetails[0].strInstructions
        
        glassLabel.text = serviceCall.drinksDetails[0].strGlass
        
        removeLoadingIndicator()
    }
    
    func addLoadingIndicator() {
        addChild(loadingViewController)
        loadingViewController.view.frame = view.frame
        view.addSubview(loadingViewController.view)
        loadingViewController.didMove(toParent: self)
    }
    
    func removeLoadingIndicator() {
        self.loadingViewController.willMove(toParent: nil)
        self.loadingViewController.view.removeFromSuperview()
        self.loadingViewController.removeFromParent()
    }
    
    func presentShareSheet() {
        let shareSheet = UIActivityViewController(activityItems: [instructionsLabel.text!], applicationActivities: nil)
        
        present(shareSheet, animated: true)
        
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
