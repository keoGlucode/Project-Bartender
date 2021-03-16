//
//  CocktailsManager.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

class CocktailsManager {
    
    var catergories = CocktailData()
    
    var drinks = CocktailDetails()
    
    func performRequest(completed: @escaping () -> () ) {
        
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
                        self.catergories = try JSONDecoder().decode(CocktailData.self, from: safeData)
                        
                        
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
    
    /*mutating func parseJson(cocktailData : Data) -> CocktailData? {
        
        let decoder = JSONDecoder()
        
        do {
            catergories = try decoder.decode(CocktailData.self, from: cocktailData)
            
            
            
            return catergories
        }
        catch {
            return nil
        }
    }*/
    
    
    

    
    func performDrinksRequest(stringAppend: String, completed: @escaping () -> () ) {
        
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    do {
                        self.drinks = try JSONDecoder().decode(CocktailDetails.self, from: safeData)
                        
                        print(self.drinks)
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
    
    /* func parseDrinksJson(cocktailData : Data) -> CocktailDetails? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CocktailDetails.self, from: cocktailData)
            
            print("yeyi")
            
            return decodedData
        }
        catch {
            return nil
        }
    }*/
    
}
