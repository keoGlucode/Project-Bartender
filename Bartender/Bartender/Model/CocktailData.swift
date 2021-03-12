//
//  CocktailData.swift
//  Bartender
//
//  Created by Keo Shiko on 2021/03/11.
//  Copyright © 2021 Glucode. All rights reserved.
//

import Foundation

struct CocktailData: Decodable {
    let drinks : [Category]
}

struct Category: Decodable {
    let strCategory : String
}

struct CocktailDetails : Decodable {
    let drinks : [Details]
}

struct Details : Decodable {
    //let idDrinks : Int
    let strDrink : String
    //let strDrinkThumb : String
}
