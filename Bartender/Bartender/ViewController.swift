//
//  ViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/09.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cocktails = CocktailsManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktails.performRequest()
    }


}

