//
//  ListCollectionViewController.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/19.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ListCollectionViewCell"




class ListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var serviceCall = CocktailsManager()
    var drinkItem = [Details]()
    
    var loadingViewController = LoadingViewController()
    
    var categoryItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.collectionViewLayout = UICollectionViewFlowLayout()
        
        addLoadingIndicator()
        
        self.performDrinksRequest(stringAppend: categoryItem, completed: removeLoadingIndicator )

    }
    
    // initialized with a non-nil layout parameter
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder ADecoder: NSCoder) {
        super.init(coder: ADecoder)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return drinkItem.count > 0 ? drinkItem.count : 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ListCollectionViewCell
    
        cell.setupOutlets(drinkItem: drinkItem[indexPath.row])
    
        return cell
    }
    
    func printResult()  {

        self.collectionView.reloadData()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150, height: 250)
    }
    
    func performDrinksRequest(stringAppend: String, completed: @escaping () -> () ) {
        
        let correctString = manageString(categoryName: stringAppend)
        
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(correctString)"
        
        
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    do {
                        
                        let det = try JSONDecoder().decode(CocktailDetails.self, from: safeData)
                        
                        self.drinkItem = det.drinks
                        //print(self.drinkItem)
                        
                        DispatchQueue.main.async {
                            completed()
                            //self.collectionView.reloadData()
                        }
                    }catch {
                        print("Error with JSON \(error.localizedDescription)")
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func manageString(categoryName : String) -> String {
        switch categoryName {
        case "Ordinary Drink":
            return "Ordinary_Drink"
        case "Milk / Float / Shake" :
            return "Milk%20/%20Float%20/%20Shake"
        case "Coffee / Tea":
            return "Coffee%20/%20Tea"
        case "Homemade Liqueur":
            return "Homemade%20Liqueur"
        case "Punch / Party Drink" :
            return "Punch%20/%20Party%20Drink"
        case "Soft Drink / Soda":
            return "Soft%20Drink%20/%20Soda"
        default:
            return categoryName
        }
            
    }
    
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "drinkDetails", sender: self)
    }
    
    
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      if let destination = segue.destination as? DrinkDetailsViewController {
          
        let drink = drinkItem[( collectionView.indexPathsForSelectedItems![0].row)]
          
        destination.drinkID = drink.idDrink
        destination.drink_Image = drink.strDrinkThumb
        destination.drinkName = drink.strDrink
        destination.navigationItem.title = drink.strDrink
      }
  }
    
    func addLoadingIndicator() {
        addChild(loadingViewController)
        loadingViewController.view.frame = view.frame
        view.addSubview(loadingViewController.view)
        loadingViewController.didMove(toParent: self)
    }
    
    func removeLoadingIndicator() {
        
        self.collectionView.reloadData()
        
        self.loadingViewController.willMove(toParent: nil)
        self.loadingViewController.view.removeFromSuperview()
        self.loadingViewController.removeFromParent()
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
