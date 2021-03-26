//
//  CocktailsTableViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/16.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class CocktailsTableViewController: UITableViewController {

    var cocktailItem = CocktailsManager()
    var categoryItem = "Ordinary_Drink"
    
    var types = ["Gin","Vodka","Whiskey","Brandy", "Rum", "Wine", "Alcoholic","Non-Alcoholic"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //cocktailItem.performDrinksRequest(stringAppend: categoryItem, completed: self.tableView.reloadData)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "drinksCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type = types[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinksCell", for: indexPath)
        
        cell.textLabel?.text = type
        
        //cell.imageView?.loadImages(urlString: category.strDrinkThumb)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "typeDrinks", sender: self)
        
        //let vc = storyboard?.instantiateViewController(identifier: "DrinkAttributesViewController") as! DrinkAttributesViewController
        
        //vc.drinkID = cocktailItem.drinks.drinks[indexPath.row].idDrink
        
        
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ListTableViewController {
            
            let drink = types[(tableView.indexPathForSelectedRow?.row)!]
            
            destination.categoryItem = drink
        }
    }




}
