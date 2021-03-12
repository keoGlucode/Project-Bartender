//
//  CocktailsManager.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

struct CocktailsManager {
    
    //var categories : CocktailData
    
    let categoryURL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
    
    func performRequest(with urlString : String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    if let category = self.parseJson(cocktailData: safeData) {
                        
                        print(category.drinks.count)
                        
                    }
                }
            }
            
            task.resume()
        }
    }
    
     func parseJson(cocktailData : Data) -> CocktailData? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CocktailData.self, from: cocktailData)
            
            
            
            return decodedData
        }
        catch {
            return nil
        }
    }
    
    mutating func setCategories(category : CocktailData) {
        //categories = category
    }
    
    func performDrinksRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                if let safeData = data {
                    
                    if let drinks = self.parseJson(cocktailData: safeData) {
                        
                        print(drinks)
                        
                        
                    }
                }
            }
            
            task.resume()
        }
    }
    
     func parseDrinksJson(cocktailData : Data) -> CocktailDetails? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CocktailDetails.self, from: cocktailData)
            
            print("yeyi")
            
            return decodedData
        }
        catch {
            return nil
        }
    }
    
}
