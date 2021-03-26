//
//  ListTableViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/23.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var loadingViewController = LoadingViewController()
    var cocktailItem = CocktailsManager()
    var categoryItem = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListCell2")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        switch categoryItem {
        case "Alcoholic":
            cocktailItem.performTypeRequest(stringAppend: categoryItem, completed: removeLoadingIndicator)
        case "Non-Alcoholic":
            cocktailItem.performTypeRequest(stringAppend: "Non_Alcoholic", completed: removeLoadingIndicator)
        default:
            cocktailItem.performFilterRequest(stringAppend: categoryItem, completed: removeLoadingIndicator)
        }
        
        
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return cocktailItem.drinks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell

        let item = cocktailItem.drinks[indexPath.row]
        
        cell.listLabel?.text = item.strDrink
        
        cell.listImage?.loadImages(urlString: item.strDrinkThumb)

        return cell
    }
    
    func addLoadingIndicator() {
        addChild(loadingViewController)
        loadingViewController.view.frame = view.frame
        view.addSubview(loadingViewController.view)
        loadingViewController.didMove(toParent: self)
    }
    
    func removeLoadingIndicator() {
        
        self.tableView.reloadData()
        
        self.loadingViewController.willMove(toParent: nil)
        self.loadingViewController.view.removeFromSuperview()
        self.loadingViewController.removeFromParent()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
