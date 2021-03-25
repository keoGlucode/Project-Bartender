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
    
    let loadingViewController = LoadingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoadingIndicator()
        cocktails.performRequest(completed: removeLoadingIndicator)
        
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
            destination.navigationItem.title = cocktails.datas[selectedRow].strCategory ??  "Just drink"
            
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

