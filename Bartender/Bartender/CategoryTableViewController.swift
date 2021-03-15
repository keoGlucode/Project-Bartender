//
//  ViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/09.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var cocktails = CocktailsManager(catergories: <#CocktailData#>)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktails.performRequest(completed: <#() -> ()#>)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.catergories.drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

