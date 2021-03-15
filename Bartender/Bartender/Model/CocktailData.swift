//
//  CocktailData.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

class CocktailData: Decodable {
    var drinks : [Category]
}

struct Category: Decodable {
    var strCategory : String
}

struct CocktailDetails : Decodable {
    let drinks : [Details]
}

struct Details : Decodable {
    //let idDrinks : Int
    let strDrink : String
    //let strDrinkThumb : String
}
