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
    var drinks = [Details]()
}

struct Details : Codable {
    var idDrink : String
    var strDrink : String
    var strDrinkThumb : String
}

struct DrinkDetails : Codable {
    var drinks = [DrinkAttributes]()
}

struct DrinkAttributes : Codable {
    var idDrink : String?
    var strAlcoholic : String?
    var strInstructions : String?
}
