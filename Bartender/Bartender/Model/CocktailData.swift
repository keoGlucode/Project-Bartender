//
//  CocktailData.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

struct CocktailData: Codable {
    
    var drinks = [Category]()
}

struct Category: Codable {
    var strCategory : String
}


struct CocktailDetails : Codable {
    let drinks = [Details]()
}

struct Details : Codable {
    //let idDrinks : Int
    let strDrink : String
    //let strDrinkThumb : String
}
