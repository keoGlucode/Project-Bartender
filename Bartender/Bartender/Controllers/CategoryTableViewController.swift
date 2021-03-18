//
//  ViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/09.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var cocktails = CocktailsManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktails.performRequest(completed: self.tableView.reloadData)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.catergories.drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = cocktails.catergories.drinks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryLabel.text = category.strCategory
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = cocktails.catergories.drinks[indexPath.row].strCategory
        
        let vc = CocktailsTableViewController()
        
        vc.categoryItem = title
        vc.navigationItem.title = title
        
        navigationController?.pushViewController(vc, animated: true)

    }
    
    
}

