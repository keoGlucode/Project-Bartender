//
//  CocktailsManager.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import UIKit

class CocktailsManager {
    
    var categories = [Category]()
    
    var drinks = [Details]()
    
    var drinksDetails = [Drink]()
    
    func performCategoryRequest(completed: @escaping () -> () ) {
        
        let categoryURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
        
        if let url = URL(string: categoryURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    do {
                        

                        
                        let cocktail = try JSONDecoder().decode(CocktailData.self, from: safeData)
                        
                        self.categories = cocktail.drinks
                        
                        DispatchQueue.main.async {
                            completed()
                            
                        }
                    }catch {
                        print("Error with JSON \(error.localizedDescription)")
                    }
                }
            }
            
            task.resume()
        }
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
                        
                        self.drinks = det.drinks

                        DispatchQueue.main.async {
                            completed()

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


    

    
    
    func performDrinksAttributesRequest(stringAppend: String, completed: @escaping () -> () ) {
        
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(stringAppend)"
        
        
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    do {
                        
                        let att = try JSONDecoder().decode(CocktailAttributes.self, from: safeData)
                        
                        self.drinksDetails = att.drinks
                        
                        DispatchQueue.main.async {
                            completed()
                            
                        }
                    }catch {
                        print("Error with JSON \(error.localizedDescription)")
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func performFilterRequest(stringAppend: String, completed: @escaping () -> () ) {
         
         let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(stringAppend)"
         
         
         
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
                         
                         self.drinks = det.drinks
                         //print(self.drinkItem)
                         
                         DispatchQueue.main.async {
                             completed()

                         }
                     }catch {
                         print("Error with JSON \(error.localizedDescription)")
                     }
                 }
             }
             
             task.resume()
         }
     }
    
    
    func performTypeRequest(stringAppend: String, completed: @escaping () -> () ) {
         
         let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=\(stringAppend)"
         
         
         
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
                         
                         self.drinks = det.drinks
                         //print(self.drinks)
                         
                         DispatchQueue.main.async {
                             completed()

                         }
                     }catch {
                         print("Error with JSON \(error.localizedDescription)")
                     }
                 }
             }
             
             task.resume()
         }
     }
    
    func toggleFavourite(drinkID : String) {
        
        print("in data provider")
        if favourites.contains(where: {$0.idDrink == drinkID})
        {
            favourites = favourites.filter({
                $0.idDrink != drinkID
            })
        }
        else {

            if let drink = self.drinks.filter({ $0.idDrink == drinkID}).first {
                print("add")
                favourites.append(drink)
            }
        }


    }
    
    func isFav(drinkID : String) -> Bool {
        return favourites.contains(where: {$0.idDrink == drinkID})
    }
    
}

//global variable for image cache
var imageCache = NSCache<NSString, UIImage>()

var favourites = [Details]()




extension UIImageView {
    func loadImages(urlString : String) {
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let unwrappedImage = UIImage(data: data) {
                    
                    imageCache.setObject(unwrappedImage, forKey: urlString as NSString)
                    
                    DispatchQueue.main.async {
                        self?.image = unwrappedImage
                    }
                }
            }
            
        }
    }
}
