//
//  ViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/09.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var dataProvider = CocktailsManager()
    
    let loadingViewController = LoadingViewController()
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoadingIndicator()
        dataProvider.performCategoryRequest(completed: removeLoadingIndicator)
        
        tableView.delegate = self
        tableView.dataSource = self
        appDelegate.dataProvider.getPList()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let category = dataProvider.categories[indexPath.row]
        
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
            destination.categoryItem = dataProvider.categories[selectedRow].strCategory ?? "Beer"
            destination.navigationItem.title = dataProvider.categories[selectedRow].strCategory ??  "Just drink"
            
        }
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
    
}

