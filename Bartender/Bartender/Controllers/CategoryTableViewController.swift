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
    var cat = "mxm"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktails.performRequest(completed: self.tableView.reloadData)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = cocktails.datas[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryLabel.text = category.strCategory
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDrinks", sender: self)
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ListCollectionViewController {
            
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            destination.categoryItem = cocktails.datas[selectedRow].strCategory ?? "Beer"
            
                //cocktails.performDrinksRequest(stringAppend: cocktails.datas[selectedRow].strCategory ?? "Beer", completed: printSomething)
            
            //destination.drinkItem = cocktails.drinks
            //print("really")
            //print(cocktails.drinks)
            
        }
    }
    
    func printSomething() {
        print("request done")
        //print(cocktails.drinks)
        
        
    }
    
    
}

