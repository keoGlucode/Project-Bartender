//
//  CocktailsManager.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

struct CocktailsManager {
    
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
                        print("yay")
                        print(category)
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
            
            print(decodedData.drinks[0])
            
            return decodedData
        }
        catch {
            return nil
        }
    }
}
